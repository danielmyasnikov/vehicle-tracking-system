class CalendarController < ApplicationController
  def index
    @services = Service.all
    @trucks = current_user.admin? ? Fleet.scoped : Fleet.where(:truck_fleet_id => TruckFleet.where(:user_id => current_user.id).pluck(:id))
    @repairers = Repairer.all
    @drivers = Driver.all
    @trainings = Training.all
    @settings = Setting.all
    @due = @trucks.due if @trucks.present?
    @overdue = @trucks.overdue if @trucks.present?
  end

  def view
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end
end
