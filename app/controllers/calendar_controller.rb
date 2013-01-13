class CalendarController < ApplicationController
  def index
    @services = Service.all
    if !current_user.admin?
      @trucks = Fleet.where(:truck_fleet_id => current_user.truck_fleet.id).order("#{current_user.truck_fleet.setting.truck_identification} ASC")
    end
    @repairers = Repairer.all
    @drivers = Driver.all
    @trainings = Training.all
    @settings = Setting.all
    @due = @trucks.due if @trucks.present?
    @overdue = @trucks.overdue if @trucks.present?
    @trucks = TruckFleet.scoped_by_vehicle if current_user.admin?
  end

  def view
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end
end
