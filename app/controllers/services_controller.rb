require 'date'

class ServicesController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyServices"
    session[:module_logo] = "" 
  end
  # GET /services
  # GET /services.json
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    
    # TODO: potential bug, should, if the user clicks on cancel then the service disappers from the scrren
    # should pass params to create method and execute saving
    if params[:serviceable] 
      @serviceable = Serviceable.find(params[:serviceable])
      @serviceable.booked = true
      @serviceable.save
    end
    
    if params[:fault_book]
      @fault_book = FaultBook.find(params[:fault_book])
      @fault_book.booked = true
      @fault_book.save
    end
    
    @service = Service.new
    @service.warranty = true
    @date = params
    @fleets = current_user.truck_fleet.fleets
    @trucks = Fleet.where(:auto_services => false).pluck(:id)
    
    @service_types = ServiceType.all.collect {|s| [s.name, s.id]}
    @service_types = @service_types + [['Fault', 0]]
    
    start_service_time = params[:hours]
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    
    # @service.start_service_time   = start_service_time
    # @service.start_service_date   = Date.new(year, month, day).strftime("%d-%m-%Y")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => { :serviceable => @serviceable } }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @fleets = current_user.truck_fleet.fleets
    @service_types = ServiceType.all.collect {|s| [s.name, s.id]}
    @service_types = @service_types + [['Fault', 0]]
    @service.start_service_date = @service.start_service_date.strftime("%d-%m-%Y")
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])
    if browser.ie7? || browser.ie8? || browser.ie9?
      a = params[:service][:start_service_date]
      a = a.split("/")
      b = a[1] + "-" + a[0] + "-" + a[2]
      @service.start_service_date = b.to_datetime
      @service.start_service_time = b.to_datetime + params[:service][:start_service_time].to_i.hour
    else
      @service.start_service_time = params[:service][:start_service_date].to_datetime + params[:service][:start_service_time].to_i.hour
    end
    
    
    @service.finish_service_time = @service.start_service_time + params[:service][:hours].to_i.hour
    @service.finish_service_date  = @service.start_service_date
    @fleet_email_contacts     = TruckFleet.find_contacts_by_fleet_id(@service.fleet_id)
    @repairer_email_contacts  = Repairer.find_contacts_by_repairer_id(@service.repairer_id) 
    @service.truck_fleet = @service.fleet.truck_fleet
    
    respond_to do |format|
      if @service.save
        UserMailer.completed_booking(current_user, @service).deliver
        # TODO: changed completed
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    if browser.ie7? || browser.ie8? || browser.ie9?
      start_service_date = params[:service][:start_service_date]
      start_service_date = a.split("/")
      start_service_date = a[1] + "-" + a[0] + "-" + a[2]
      @service.start_service_date = start_service_date.to_datetime
      @service.start_service_time = start_service_date.to_datetime + params[:service][:start_service_time].to_i.hour
    end
    @service.finish_service_time = @service.start_service_time + params[:service][:hours].to_i.hour
    @service.finish_service_date  = @service.start_service_date
    respond_to do |format|
      if @service.save && @service.update_attributes(params[:service])
        # TODO: get all changed attributes and shoot an email to the PC or SC with the person who updated the details and the details themselfs
        UserMailer.update_service(current_user, @service).deliver
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
    services = ['service', 'warranty', 'damage', 'repair', 'breakdown']
    services.each do |s| 
      if @service.send(s) == true && @service.send(s + '_done') == true
        serviceable = @service.fleet.serviceables.where(:service_type_id => params[:service][:service_type_name]).first
        next_service = @service.fleet.calc_next_period_for_services(serviceable.service_time_interval, serviceable.service_period) if !serviceable.nil?
        serviceable.update_attributes(:next_service_date => Date.today + next_service) if !serviceable.nil?
      end
    end
  end
  
  def finish
    @service = Service.find(params[:id])
    @service.archived = true
    @service.finalise = true
    # refactor this, may be there is a better way to assign values from the form :)
    @report = Report.new(
      :service_id   => @service.id              ||= params[:id],
      :fleet_id     => @service.fleet_id        ||= params[:fleet_id], 
      :warranty     => @service.warranty_price  ||= params[:warranty],
      :repair       => @service.repair_price    ||= params[:repair],
      :damage       => @service.damage_price    ||= params[:damage],
      :breakdown    => @service.breakdown_price ||= params[:breakdown],
      :service      => @service.service_price   ||= params[:service],
      :name         => @service.fleet.name,
      :model        => @service.fleet.model,
      :make         => @service.fleet.make,
      :service_date => @service.start_service_date,
      :datecode     => @service.start_service_date.strftime("%Y%m")
    )
    respond_to do |format|
      if @report.save && @service.save
        UserMailer.service_done(current_user, @service).deliver
        flash[:notice] = 'Everything went OK!' and return
      else
        flash[:warning] = 'There were some issues. Please fix them or send an email with the issue to contact@sxtrailers.com.au'
        redirect_to :back and return
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    
    # TODO: put proper values, customize DB if needed
    UserMailer.cancel_service(current_user, @service.fleet, '', '', '').deliver

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end