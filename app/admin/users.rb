ActiveAdmin.register User do
  index do
    column :email
    column :name
    column :approved
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :truck_fleet
      f.input :email
      f.input :name
      f.input :approved
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
