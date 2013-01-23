class FleetsController < ApplicationController
  # GET /fleets
  # GET /fleets.json
  def index
    @fleets = current_user.truck_fleet.fleets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fleets }
    end
  end

  # GET /fleets/1
  # GET /fleets/1.json
  def show
    @fleet = Fleet.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fleet }
    end
  end

  # GET /fleets/new
  # GET /fleets/new.json
  def new
    @fleet = Fleet.new
    @fleet.build_fleet_services
    @assets = @fleet.assets.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fleet }
    end
  end

  # GET /fleets/1/edit
  def edit
    @fleet = Fleet.find(params[:id])
    @fleet.prepare_services
    @assets = @fleet.assets.new
  end
  
  def postpone
    @fleet = Fleet.find(params[:id])
  end

  # POST /fleets
  # POST /fleets.json
  def create
    @fleet = Fleet.new(params[:fleet])
    @assets = Asset.new(params[:asset][:invoice]) 
    respond_to do |format|
      if @fleet.save && @assets.save
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
    @asset = Asset.new(params[:asset])
    @asset.fleet = @fleet

    respond_to do |format|
      if @fleet.update_attributes(params[:fleet]) && @fleet.update_serviceables(params[:fields]) && @asset.save
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
