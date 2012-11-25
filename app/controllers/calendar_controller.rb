class CalendarController < ApplicationController
  def index
    @services = Service.all
    @trucks = Fleet.all
    @repairers = Repairer.all
    @drivers = Driver.all
    @trainings = Training.all
    @settings = Setting.all
  end

  def view
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end
end
