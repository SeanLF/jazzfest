# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_01_150438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string("name")
    t.date("start_date")
    t.date("end_date")
    t.date("registration_start_date")
    t.date("registration_end_date")
    t.boolean("active")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
  end

  create_table "opportunity_application_statuses", force: :cascade do |t|
    t.string("name")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
    t.string("action_name")
    t.string("action_color")
  end

  create_table "opportunity_applications", force: :cascade do |t|
    t.bigint("profile_id")
    t.text("availability")
    t.string("choices")
    t.boolean("submitted")
    t.bigint("opportunity_application_status_id")
    t.text("coordinator_notes")
    t.bigint("accepted_volunteer_opportunity_id")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
    t.index(["accepted_volunteer_opportunity_id"], name: "index_applications_on_accepted_opportunity_id")
    t.index(["opportunity_application_status_id"], name: "index_applications_on_application_status_id")
    t.index(["profile_id"], name: "index_opportunity_applications_on_profile_id")
  end

  create_table "profiles", force: :cascade do |t|
    t.text("auth0_id")
    t.text("email")
    t.text("first_name")
    t.text("last_name")
    t.text("address")
    t.text("city")
    t.text("province")
    t.text("postal_code")
    t.text("home_phone_number")
    t.text("cell_phone_number")
    t.text("work_phone_number")
    t.text("t_shirt_size")
    t.text("age_group")
    t.text("emergency_contact_name")
    t.text("emergency_contact_number")
    t.text("notes")
    t.boolean("code_of_conduct")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
  end

  create_table "settings", force: :cascade do |t|
    t.string("name")
    t.string("value_type")
    t.string("value")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
  end

  create_table "users", force: :cascade do |t|
    t.string("auth0_id")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
    t.index(["auth0_id"], name: "index_users_on_auth0_id", unique: true)
  end

  create_table "versions", force: :cascade do |t|
    t.string("item_type")
    t.string("{:null=>false}")
    t.integer("item_id", null: false)
    t.string("event", null: false)
    t.string("whodunnit")
    t.text("object")
    t.datetime("created_at")
    t.index(["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id")
  end

  create_table "volunteer_opportunities", force: :cascade do |t|
    t.text("title")
    t.text("objective")
    t.text("duties_and_responsibilities")
    t.text("qualifications_and_requirements")
    t.text("shifts")
    t.boolean("visible")
    t.datetime("created_at", precision: 6, null: false)
    t.datetime("updated_at", precision: 6, null: false)
  end

  add_foreign_key "opportunity_applications", "opportunity_application_statuses"
  add_foreign_key "opportunity_applications", "profiles"
  add_foreign_key "opportunity_applications", "volunteer_opportunities", column: "accepted_volunteer_opportunity_id"
end
