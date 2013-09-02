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

ActiveRecord::Schema.define(:version => 20130829095038) do

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
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "city"
    t.string   "formatted_address"
    t.string   "state"
    t.string   "postal_code"
    t.string   "state2"
    t.string   "sublocality"
  end

  add_index "address_locations", ["city_id"], :name => "index_address_locations_on_city_id"

  create_table "address_regions", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
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
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "avatar"
    t.string   "resume_src"
  end

  create_table "chief_profiles", :force => true do |t|
    t.string  "name"
    t.integer "department_id"
    t.string  "chief_photo"
    t.integer "gender"
  end

  add_index "chief_profiles", ["department_id"], :name => "index_chief_profiles_on_department_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "contacts", :force => true do |t|
    t.integer  "contact_type_id"
    t.integer  "school_id"
    t.integer  "profile_id"
    t.integer  "director_profile_id"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "contacts", ["director_profile_id"], :name => "index_contacts_on_director_profile_id"
  add_index "contacts", ["profile_id"], :name => "index_contacts_on_profile_id"
  add_index "contacts", ["school_id"], :name => "index_contacts_on_school_id"

  create_table "departments", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.string  "permalink"
    t.integer "location_id"
    t.integer "user_id"
  end

  add_index "departments", ["location_id"], :name => "index_departments_on_location_id"
  add_index "departments", ["user_id"], :name => "index_departments_on_user_id"

  create_table "director_profiles", :force => true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.string   "director_photo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "gender"
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
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "school"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "galleryable_id"
    t.string   "galleryable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "galleries", ["galleryable_id", "galleryable_type"], :name => "galleries_index"

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "released_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "admin_id"
  end

  create_table "pictures", :force => true do |t|
    t.string   "src"
    t.string   "title"
    t.integer  "gallery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.date     "birth_date"
    t.string   "video_url"
    t.integer  "applicant_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "gender"
    t.string   "birth_location"
    t.string   "current_location"
  end

  create_table "school_departments", :force => true do |t|
    t.integer  "department_id"
    t.integer  "school_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "school_departments", ["department_id"], :name => "index_school_departments_on_department_id"
  add_index "school_departments", ["school_id"], :name => "index_school_departments_on_school_id"

  create_table "schools", :force => true do |t|
    t.string  "name"
    t.integer "education_school_type_id"
    t.integer "location_id"
    t.integer "user_id"
    t.text    "description"
    t.string  "video_url"
    t.string  "permalink"
  end

  create_table "social_activities", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "activity_type"
    t.string   "duties"
    t.string   "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "specialties", :force => true do |t|
    t.string   "name"
    t.integer  "specialty_category_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "specialty_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "user_type_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "user_type_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "vacancies", :force => true do |t|
    t.integer  "specialty_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "school_id"
    t.float    "value"
    t.date     "expiry_date"
  end

  create_table "work_experiences", :force => true do |t|
    t.integer  "applicant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "organization"
    t.string   "position"
    t.string   "duties"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
