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

ActiveRecord::Schema.define(:version => 20120211185704) do

  create_table "address_cities", :force => true do |t|
    t.string  "name"
    t.integer "region_id"
  end

  add_index "address_cities", ["region_id"], :name => "index_address_cities_on_region_id"

  create_table "address_countries", :force => true do |t|
    t.string "name"
  end

  create_table "address_locations", :force => true do |t|
    t.integer  "city_id"
    t.string   "street"
    t.string   "building"
    t.string   "apartment"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_locations", ["city_id"], :name => "index_address_locations_on_city_id"

  create_table "address_regions", :force => true do |t|
    t.string "name"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                :default => "", :null => false
    t.string   "encrypted_password",   :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.integer  "failed_attempts",      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["authentication_token"], :name => "index_admins_on_authentication_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "applicants", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "permalink"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_degree_levels", :force => true do |t|
    t.string "education_degree_level"
  end

  create_table "education_school_types", :force => true do |t|
    t.string "school_type_name"
  end

  create_table "educations", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "school_id"
    t.integer  "education_degree_level_id"
    t.integer  "education_school_type_id"
    t.string   "faculty"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.date     "birth_date"
    t.integer  "birth_location_id"
    t.integer  "current_location_id"
    t.string   "video_url"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string  "name"
    t.integer "type_id"
    t.integer "city_id"
  end

  create_table "social_activities", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "activity_type"
    t.string   "duties"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "work_experiences", :force => true do |t|
    t.integer  "applicant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "organization"
    t.string   "position"
    t.string   "duties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
