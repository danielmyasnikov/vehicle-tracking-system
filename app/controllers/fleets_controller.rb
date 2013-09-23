class FleetsController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyFleet"
    session[:module_logo] = "fleet-image.png"
  end
  
  # GET /fleets
  # GET /fleets.json
  def index
    @fleets = current_user.truck_fleet.fleets
    @columns_to_sort = ["make", "model", "year", "vin", "registration", "fleet_number"]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fleets }
    end
  end

  # GET /fleets/1
  # GET /fleets/1.json
  def show
    @fleet = Fleet.find(params[:id])
    @invoices = @fleet.assets.limit 3
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fleet }
    end
  end

  # GET /fleets/new
  # GET /fleets/new.json
  def new
    @fleet = Fleet.new
    @fleet.build_fleet_services current_user
    @assets = @fleet.assets.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fleet }
    end
  end

  # GET /fleets/1/edit
  def edit
    @fleet = Fleet.find(params[:id])
    @fleet.prepare_services current_user
    @assets = @fleet.assets.build
  end
  
  # TODO: move to services / serviceables
  def postpone
    @serviceable = Serviceable.where(:service_type_id => params[:service_id], :fleet_id => params[:id]).first
    @serviceable.next_service_date = @serviceable.next_service_date.strftime("%d/%m/%Y")
  end
  
  # TODO: move to services / serviceables
  def postponed
    @serviceable = Serviceable.find(params[:id])
    @serviceable.update_attributes(params[:serviceable])
    UserMailer.postponed_service(current_user, @serviceable).deliver
    redirect_to controller: :calendar, action: :index
  end
  
  # TODO: move to services / serviceables
  def cancel
    @serviceable = Serviceable.where(:service_type_id => params[:service_id], :fleet_id => params[:id]).first
    @serviceable.cancel_service # TODO if !@serviceable.set_date
    fleet = Fleet.find(params[:id])
    UserMailer.cancel_service(current_user, fleet, @serviceable.service_type.name, nil, nil).deliver
    redirect_to controller: :calendar, action: :index
  end
  
  def canceled
    
  end

  # POST /fleets
  # POST /fleets.json
  def create
    @fleet = Fleet.new(params[:fleet])
    @assets = Asset.new(params[:asset]) 
    @assets.fleet = @fleet
    @fleet.truck_fleet = current_user.truck_fleet
    
    respond_to do |format|
      if @fleet.save
        @assets.save
        @fleet.prepare_services current_user
        @fleet.update_serviceables(params[:fields]) 
        format.html { redirect_to @fleet, notice: 'Fleet was successfully created.' }
        format.json { render json: @fleet, status: :created, location: @fleet }
      else
        format.html { render action: "new" }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fleets/1
  # PUT /fleets/1.json
  def update
    @fleet = Fleet.find(params[:id])
    @assets = Asset.new(params[:asset])
    @assets.fleet = @fleet

    respond_to do |format|
      if @fleet.update_attributes(params[:fleet])
        @fleet.update_serviceables(params[:fields]) 
        @assets.save
        # TODO: test it!
        UserMailer.update_vehicle_info(current_user, @fleet).deliver
        format.html { redirect_to @fleet, notice: 'Fleet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fleets/1
  # DELETE /fleets/1.json
  def destroy
    @fleet = Fleet.find(params[:id])
    @fleet.destroy

    respond_to do |format|
      format.html { redirect_to fleets_url }
      format.json { head :no_content }
    end
  end
end
