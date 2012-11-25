require 'date'

class ServicesController < ApplicationController
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
    
    @trucks = Fleet.where(:auto_services => false).pluck(:id)
    
    start_service_time = params[:hours]
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    
    @service.start_service_time   = start_service_time
    @service.start_service_date   = Date.new(year, month, day) if year.to_s != "0"
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
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])
    @service.finish_service_time = @service.start_service_time + params[:service][:hours].to_i.hour
    @user_group = current_user.find_subscribtions
    
    respond_to do |format|
      if @service.save
        UserMailer.service(@service).deliver
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
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end
