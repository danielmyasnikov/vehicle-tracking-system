class ReportController < ApplicationController
  def index
    @fleets = Fleet.where(:truck_fleet_id => current_user.truck_fleet_id)
    respond_to do |format|
      format.html
    end
  end

  def show
  end
end
