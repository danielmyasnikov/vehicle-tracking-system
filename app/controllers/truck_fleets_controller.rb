class TruckFleetsController < ApplicationController
  # GET /truck_fleets
  # GET /truck_fleets.json
  def index
    @truck_fleets = TruckFleet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @truck_fleets }
    end
  end

  # GET /truck_fleets/1
  # GET /truck_fleets/1.json
  def show
    @truck_fleet = TruckFleet.find(params[:id])
    @fleets = @truck_fleet.fleets
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @truck_fleet }
    end
  end

  # GET /truck_fleets/new
  # GET /truck_fleets/new.json
  def new
    @truck_fleet = TruckFleet.new
    
    3.times do
      @truck_fleet.contact_truck_fleets.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @truck_fleet }
    end
  end

  # GET /truck_fleets/1/edit
  def edit
    
    @truck_fleet = TruckFleet.find(params[:id])
    @users = @truck_fleet.users
  end

  # POST /truck_fleets
  # POST /truck_fleets.json
  def create
    @truck_fleet = TruckFleet.new(params[:truck_fleet])
    @truck_fleet.contact_truck_fleets.build

    respond_to do |format|
      if @truck_fleet.save
        @setting = Setting.new(:truck_fleet_id => @truck_fleet.id, :truck_identification => 'fleet_number')
        @setting.save
        format.html { redirect_to @truck_fleet, notice: 'Truck fleet was successfully created.' }
        format.json { render json: @truck_fleet, status: :created, location: @truck_fleet }
      else
        format.html { render action: "new" }
        format.json { render json: @truck_fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /truck_fleets/1
  # PUT /truck_fleets/1.json
  def update
    @truck_fleet = TruckFleet.find(params[:id])

    respond_to do |format|
      if @truck_fleet.update_attributes(params[:truck_fleet])
        format.html { redirect_to @truck_fleet, notice: 'Truck fleet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @truck_fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck_fleets/1
  # DELETE /truck_fleets/1.json
  def destroy
    @truck_fleet = TruckFleet.find(params[:id])
    @truck_fleet.destroy

    respond_to do |format|
      format.html { redirect_to truck_fleets_url }
      format.json { head :no_content }
    end
  end
end
