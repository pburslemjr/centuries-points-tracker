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

ActiveRecord::Schema.define(version: 2021_10_19_152528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "approved_hours", force: :cascade do |t|
    t.integer "service_hour_id"
    t.integer "admin_id"
    t.date "date_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attendence_list", force: :cascade do |t|
    t.integer "member_id"
    t.integer "event_id"
  end

  create_table "event_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.boolean "isMandatory"
    t.string "location"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "time"
    t.datetime "datetime"
    t.string "name"
  end

  create_table "member_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "members", force: :cascade do |t|
    t.string "email_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_hour_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "service_hours", force: :cascade do |t|
    t.integer "member_id"
    t.date "date"
    t.integer "approval_list_id"
    t.string "description"
    t.integer "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_log_hours", force: :cascade do |t|
    t.float "hours"
    t.date "date"
    t.string "activity"
    t.string "description_service"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
