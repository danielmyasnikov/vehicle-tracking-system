# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130413100504) do

  create_table "animals", :force => true do |t|
    t.date     "born_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assets", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "invoice_file_name"
    t.string   "invoice_content_type"
    t.integer  "invoice_file_size"
    t.datetime "invoice_updated_at"
    t.integer  "fleet_id"
  end

  create_table "contact_repairers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "repairer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contact_truck_fleets", :force => true do |t|
    t.boolean  "main"
    t.string   "title"
    t.string   "mobile"
    t.string   "email"
    t.integer  "truck_fleet_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "pic"
    t.string   "dl_number"
    t.date     "dl_expiry"
    t.string   "training_schedule"
    t.string   "training_documents"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "fleet_id"
    t.integer  "truck_fleet_id"
  end

  create_table "email_notifications", :force => true do |t|
    t.integer "setting_id"
    t.integer "notification_id"
    t.boolean "primary"
    t.boolean "secondary"
    t.integer "frequency"
    t.integer "interval"
  end

  create_table "fault_books", :force => true do |t|
    t.string   "fault_type"
    t.integer  "driver_id"
    t.integer  "fleet_id"
    t.date     "fault_date"
    t.string   "mileage"
    t.string   "contact_no"
    t.text     "faults"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fautl_books", :force => true do |t|
    t.string   "fault_type"
    t.integer  "driver_id"
    t.integer  "fleet_id"
    t.date     "fault_date"
    t.string   "mileage"
    t.string   "contact_no"
    t.text     "faults"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fleet_service_infos", :force => true do |t|
    t.integer  "fleet_id"
    t.integer  "service_id"
    t.float    "km_since_last_service"
    t.float    "time_since_last_service"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "fleets", :force => true do |t|
    t.string   "pic"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "vin"
    t.string   "registration"
    t.string   "fleet_number"
    t.boolean  "auto_services"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "truck_fleet_id"
    t.float    "km_estimates"
    t.string   "period"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "service_frequency_period"
    t.string   "service_frequency_number"
    t.date     "last_service_date"
    t.date     "next_service_date"
    t.string   "vehicle_type"
    t.text     "other"
    t.float    "actual_km"
    t.float    "km"
    t.string   "invoice_file_name"
    t.string   "invoice_content_type"
    t.integer  "invoice_file_size"
    t.datetime "invoice_updated_at"
    t.integer  "age"
  end

  create_table "notifications", :force => true do |t|
    t.string   "name"
    t.boolean  "primary"
    t.boolean  "secondary"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "required_intervals"
  end

  create_table "repairers", :force => true do |t|
    t.string   "business_name"
    t.string   "picture"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "suburb"
    t.string   "state"
    t.integer  "postcode"
    t.boolean  "hour_service_24"
    t.string   "phone_number"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "full_address"
  end

  create_table "reports", :force => true do |t|
    t.integer  "fleet_id"
    t.integer  "service_id"
    t.float    "warranty"
    t.float    "repair"
    t.float    "damage"
    t.float    "breakdown"
    t.float    "service"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reports", ["fleet_id"], :name => "index_reports_on_fleet_id"
  add_index "reports", ["service_id"], :name => "index_reports_on_service_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "service_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "serviceables", :force => true do |t|
    t.integer  "service_type_id"
    t.integer  "fleet_id"
    t.float    "service_km_interval"
    t.float    "service_time_interval"
    t.string   "service_period"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.date     "next_service_date"
  end

  create_table "services", :force => true do |t|
    t.integer  "fleet_id"
    t.integer  "repairer_id"
    t.string   "service_type"
    t.boolean  "self_service"
    t.float    "KM_since_last_service"
    t.float    "time_since_last_service"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.date     "start_service_date"
    t.date     "finish_service_date"
    t.time     "start_service_time"
    t.time     "finish_service_time"
    t.string   "name"
    t.boolean  "warranty"
    t.boolean  "damage"
    t.boolean  "repair"
    t.boolean  "breakdown"
    t.text     "other"
    t.float    "service_price"
    t.float    "repair_price"
    t.float    "warranty_price"
    t.float    "damage_price"
    t.float    "breakdown_price"
    t.boolean  "service"
    t.integer  "hours"
    t.boolean  "service_done"
    t.boolean  "repair_done"
    t.boolean  "warranty_done"
    t.boolean  "damage_done"
    t.boolean  "breakdown_done"
    t.string   "service_type_name"
    t.integer  "truck_fleet_id"
    t.boolean  "archived"
  end

  create_table "settings", :force => true do |t|
    t.string   "truck_identification"
    t.string   "email_periods"
    t.integer  "email_recepient_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "truck_fleet_id"
    t.string   "sort"
    t.string   "email"
    t.string   "update_vehicle_info"
    t.string   "cancel_service"
    t.string   "postponed_service"
    t.string   "due_service"
    t.string   "overdue_service"
    t.integer  "overdue_service_reminder_interval"
    t.string   "completed_booking"
    t.string   "booking_date_reminder"
    t.string   "pre_booking_date_reminder"
    t.integer  "pre_booking_date_reminder_interval"
    t.string   "service_date"
    t.string   "overdue_service_information_incomplete"
    t.string   "service_done"
    t.string   "updated_rescheduled_service"
  end

  create_table "subscribers", :force => true do |t|
    t.integer  "subscribtion_id"
    t.integer  "user_id"
    t.boolean  "stop_this_email"
    t.boolean  "unsubscribe"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "subscribtions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trainings", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "start_time"
    t.time     "finish_time"
    t.integer  "driver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "truck_fleets", :force => true do |t|
    t.string   "trading_name_of_business"
    t.string   "street"
    t.string   "street_2"
    t.string   "suburb"
    t.string   "state"
    t.integer  "postcode"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.boolean  "approved",               :default => false, :null => false
    t.boolean  "admin",                  :default => false
    t.integer  "truck_fleet_id"
  end

  add_index "users", ["approved"], :name => "index_users_on_approved"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
