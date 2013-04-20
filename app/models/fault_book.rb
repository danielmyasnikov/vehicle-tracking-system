class FaultBook < ActiveRecord::Base
  attr_accessible :contact_no, :driver_id, :fault_date, :fault_type,
                  :faults, :fleet_id, :mileage, :address
  
  belongs_to :fleet
  belongs_to :driver
  geocoded_by :address
  after_validation :geocode
  # TODO: validate presence of driver, flet, faults, fault_type, 
  
  def self.belongs_to_truck_fleet(truck_fleet, fault_books)
    fault_books_to_return = []
    if fault_books.present?
      fault_books.each do |fb|
        fault_books_to_return << fb if fb.fleet.truck_fleet == truck_fleet
      end
    end
    return fault_books_to_return
  end
end
