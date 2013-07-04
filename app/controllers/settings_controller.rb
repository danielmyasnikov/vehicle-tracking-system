class SettingsController < ApplicationController
  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @settings }
    end
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
    @setting = Setting.find(params[:id])
    @notifications = Notification.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setting }
    end
  end

  # GET /settings/new
  # GET /settings/new.json
  def new
    @setting = Setting.new(:truck_fleet_id => current_user.truck_fleet.id) if !current_user.admin?
    @setting = Setting.new(:truck_fleet_id => 3) if current_user.admin
    @setting.build_email_notifications
    @notifications = Notification.all
    @days = [['1 day', 1],['2 days', 2],['3 days', 3],['4 days', 4],['5 days', 5],['6 days', 6],['7 days', 7]]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setting }
    end
  end

  # GET /settings/1/edit
  def edit
    @users = current_user.truck_fleet.users.order(:name)
    @setting = Setting.find(params[:id])
    @setting.prepare_email_notifications
    @notifications = Notification.all
    @days = [['1 day', 1],['2 days', 2],['3 days', 3],['4 days', 4],['5 days', 5],['6 days', 6],['7 days', 7]]
    @notifications.each do |n|
      @setting.email_notifications.build(:notification_id => n.id)
    end if @setting.email_notifications.blank?
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(params[:setting])
    @notifications = Notification.all
    respond_to do |format|
      if @setting.save
        # @setting.update_notifications(params[:fields])
        format.html { redirect_to @setting, notice: 'Setting was successfully created.' }
        format.json { render json: @setting, status: :created, location: @setting }
      else
        format.html { render action: "new" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    @setting = Setting.find(params[:id])
    @notifications = Notification.all
    respond_to do |format|
      if @setting.update_attributes(params[:setting]) && @setting.update_notifications(params[:fields])
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to settings_url }
      format.json { head :no_content }
    end
  end
end
