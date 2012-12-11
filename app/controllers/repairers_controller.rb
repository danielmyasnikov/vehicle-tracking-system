class RepairersController < ApplicationController
  # GET /repairers
  # GET /repairers.json
  def index
    @repairers = Repairer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @repairers }
    end
  end

  # GET /repairers/1
  # GET /repairers/1.json
  def show
    @repairer = Repairer.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @repairer }
    end
  end

  # GET /repairers/new
  # GET /repairers/new.json
  def new
    @repairer = Repairer.new
    
    3.times do
      @repairer.contact_repairers.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @repairer }
    end
  end

  # GET /repairers/1/edit
  def edit
    @repairer = Repairer.find(params[:id])
  end

  # POST /repairers
  # POST /repairers.json
  def create
    @repairer = Repairer.new(params[:repairer])

    respond_to do |format|
      if @repairer.save
        format.html { redirect_to @repairer, notice: 'Repairer was successfully created.' }
        format.json { render json: @repairer, status: :created, location: @repairer }
      else
        format.html { render action: "new" }
        format.json { render json: @repairer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /repairers/1
  # PUT /repairers/1.json
  def update
    @repairer = Repairer.find(params[:id])

    respond_to do |format|
      if @repairer.update_attributes(params[:repairer])
        format.html { redirect_to @repairer, notice: 'Repairer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @repairer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairers/1
  # DELETE /repairers/1.json
  def destroy
    @repairer = Repairer.find(params[:id])
    @repairer.destroy

    respond_to do |format|
      format.html { redirect_to repairers_url }
      format.json { head :no_content }
    end
  end
end
