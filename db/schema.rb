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

ActiveRecord::Schema.define(:version => 20121111102858) do

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
    t.string   "VIN"
    t.string   "registration"
    t.string   "fleet_number"
    t.boolean  "auto_services"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "truck_fleet_id"
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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "services", :force => true do |t|
    t.integer  "fleet_id"
    t.integer  "repairer_id"
    t.string   "service_type"
    t.string   "warranty"
    t.text     "damage"
    t.string   "repair"
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
