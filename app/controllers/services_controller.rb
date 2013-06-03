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
    
    @service.start_service_time   = start_service_time
    @service.start_service_date   = Date.new(year, month, day).strftime("%d-%m-%Y") if year.to_s != "0"
    @service.finish_service_date  = @service.start_service_date

    respond_to do |format|
      format.html # new.html.erb
      format.json { 
        render :json => {
          :service => @service,
          :truck_ids => @trucks
        }
      }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @fleets = current_user.truck_fleet.fleets
  end

  # POST /services
  # POST /services.json
  def create
    puts params.to_yaml
    @service = Service.new(params[:service])
    @service.finish_service_time = @service.start_service_time + params[:service][:hours].to_i.hour
    
    @fleet_email_contacts     = TruckFleet.find_contacts_by_fleet_id(@service.fleet_id)
    @repairer_email_contacts  = Repairer.find_contacts_by_repairer_id(@service.repairer_id) 
    
    
    
    respond_to do |format|
      if @service.save
        # UserMailer.completed_booking(current_user, @service).deliver
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

    respond_to do |format|
      if @service.update_attributes(params[:service])
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
        serviceable.update_attributes(:next_service_date => Date.today + @service.fleet.calc_next_period_for_services(serviceable.service_time_interval, serviceable.service_period))
        # TODO: who updaetd the service + send to the primary and secondary contact details of the fleet 
      end
    end
  end
  
  def finish
    @service = Service.find(params[:id])
    @service.archived = true
    puts params
    # refactor this, may be there is a better way to assign values from the form :)
    @report = @service.reports.build(
      :fleet_id     => @service.fleet_id        ||= params[:fleet_id], 
      :warranty     => @service.warranty_price  ||= params[:warranty],
      :repair       => @service.repair_price    ||= params[:repair],
      :damage       => @service.damage_price    ||= params[:damage],
      :breakdown    => @service.breakdown_price ||= params[:breakdown],
      :service      => @service.service_price   ||= params[:service]
    )
    respond_to do |format|
      if @report.save && @service.save
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
