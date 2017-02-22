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

ActiveRecord::Schema.define(version: 20170222002711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "registration_start_date"
    t.date     "registration_end_date"
    t.boolean  "active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "opportunity_applications", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "availability"
    t.string   "choices"
    t.boolean  "submitted"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id"], name: "index_opportunity_applications_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "auth0_id"
    t.text     "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "address"
    t.text     "city"
    t.text     "province"
    t.text     "postal_code"
    t.text     "home_phone_number"
    t.text     "cell_phone_number"
    t.text     "work_phone_number"
    t.text     "t_shirt_size"
    t.text     "age_group"
    t.text     "emergency_contact_name"
    t.text     "emergency_contact_number"
    t.text     "notes"
    t.boolean  "code_of_conduct"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "volunteer_opportunities", force: :cascade do |t|
    t.text     "title"
    t.text     "objective"
    t.text     "duties_and_responsibilities"
    t.text     "qualifications_and_requirements"
    t.text     "shifts"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "visible"
  end

  add_foreign_key "opportunity_applications", "profiles"
end
