ActiveAdmin.register TruckFleet do
  index do
    column :trading_name_of_business
    column :street
    column :state
    column :postcode
    default_actions
  end
end
