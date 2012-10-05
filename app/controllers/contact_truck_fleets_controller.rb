class ContactTruckFleetsController < ApplicationController
  # GET /contact_truck_fleets
  # GET /contact_truck_fleets.json
  def index
    @contact_truck_fleets = ContactTruckFleet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_truck_fleets }
    end
  end

  # GET /contact_truck_fleets/1
  # GET /contact_truck_fleets/1.json
  def show
    @contact_truck_fleet = ContactTruckFleet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_truck_fleet }
    end
  end

  # GET /contact_truck_fleets/new
  # GET /contact_truck_fleets/new.json
  def new
    @contact_truck_fleet = ContactTruckFleet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_truck_fleet }
    end
  end

  # GET /contact_truck_fleets/1/edit
  def edit
    @contact_truck_fleet = ContactTruckFleet.find(params[:id])
  end

  # POST /contact_truck_fleets
  # POST /contact_truck_fleets.json
  def create
    @contact_truck_fleet = ContactTruckFleet.new(params[:contact_truck_fleet])

    respond_to do |format|
      if @contact_truck_fleet.save
        format.html { redirect_to @contact_truck_fleet, notice: 'Contact truck fleet was successfully created.' }
        format.json { render json: @contact_truck_fleet, status: :created, location: @contact_truck_fleet }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_truck_fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_truck_fleets/1
  # PUT /contact_truck_fleets/1.json
  def update
    @contact_truck_fleet = ContactTruckFleet.find(params[:id])

    respond_to do |format|
      if @contact_truck_fleet.update_attributes(params[:contact_truck_fleet])
        format.html { redirect_to @contact_truck_fleet, notice: 'Contact truck fleet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_truck_fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_truck_fleets/1
  # DELETE /contact_truck_fleets/1.json
  def destroy
    @contact_truck_fleet = ContactTruckFleet.find(params[:id])
    @contact_truck_fleet.destroy

    respond_to do |format|
      format.html { redirect_to contact_truck_fleets_url }
      format.json { head :no_content }
    end
  end
end
