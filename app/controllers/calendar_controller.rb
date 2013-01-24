class CalendarController < ApplicationController
  def index
    if !current_user.admin?
      @trucks = current_user.truck_fleet.fleets.order("#{current_user.truck_fleet.setting.truck_identification} ASC")
      @drivers = current_user.truck_fleet.drivers
      @services = Service.where(:fleet_id => current_user.truck_fleet.fleets.pluck(:id)) if current_user.truck_fleet.fleets.present?
    end
    @repairers = Repairer.all
    @trainings = Training.all
    @settings = Setting.all
    @due = Serviceable.due(@trucks.pluck(:id)) if @trucks.present?
    @overdue = Serviceable.overdue(@trucks.pluck(:id)) if @trucks.present?
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
