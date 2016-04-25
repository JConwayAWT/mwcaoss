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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160425193116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: true do |t|
    t.text     "message",                        null: false
    t.integer  "lifespan_in_hours", default: 12, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_requests", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.text     "address"
    t.string   "email"
    t.string   "telephone"
    t.string   "best_time_to_contact"
    t.text     "inquiry_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employment_applications", force: true do |t|
    t.string   "name"
    t.string   "business_name"
    t.text     "address"
    t.string   "telephone"
    t.string   "email"
    t.text     "current_sop_details"
    t.string   "how_did_you_hear"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
