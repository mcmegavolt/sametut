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

ActiveRecord::Schema.define(:version => 20111107220815) do

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
    t.string   "school_name"
    t.integer  "school_type"
    t.integer  "degree"
    t.string   "faculty"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.date     "birth_date"
    t.string   "birth_location"
    t.string   "current_location"
    t.string   "video_url"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string "name"
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
    t.string   "email"
    t.integer  "user_type_id"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
