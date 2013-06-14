class CalendarController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyCalendar"
    session[:module_logo] = "calendar-guy.png" 
  end
  
  def index
    if !current_user.admin?
      @trucks = current_user.truck_fleet.fleets.order("#{current_user.truck_fleet.setting.truck_identification} ASC")
      @drivers = current_user.truck_fleet.drivers
      @services = Service.where(:fleet_id => current_user.truck_fleet.fleets.pluck(:id)) if current_user.truck_fleet.fleets.present?
      @services = @services.where(:archived => [false, nil])
    end
    @repairers = Repairer.all
    @trainings = Training.all
    @settings = Setting.all
    @due = Serviceable.due(@trucks.pluck(:id)) if @trucks.present?
    @due = @due.where("serviceables.booked != ?", true)
    @due = @due.where(Serviceable.arel_table[:booked].not_eq(true))
    @truck_fleet_fault_book_major = FaultBook.belongs_to_truck_fleet(
      current_user.truck_fleet, FaultBook.scoped
                                          .where(:fault_type => 'Major')
                                          .where("fault_date < ?", Date.today + 7)
    )
    @truck_fleet_fault_book_minor = FaultBook.belongs_to_truck_fleet(
      current_user.truck_fleet, FaultBook.scoped
                                          .where(:fault_type => "Minor")
                                          .where("fault_date < ?", Date.today + 7)
    )
    @due = @due + @truck_fleet_fault_book_minor
    @overdue = Serviceable.overdue(@trucks.pluck(:id)) if @trucks.present?
    @overdue = @overdue.where(Serviceable.arel_table[:booked].not_eq(true))
    @overdue = @overdue + @truck_fleet_fault_book_major
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
