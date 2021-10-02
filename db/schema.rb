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

ActiveRecord::Schema.define(version: 2021_10_02_164804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "event_list", force: :cascade do |t|
    t.integer "eventlistID"
    t.integer "memberID"
  end

  create_table "events", force: :cascade do |t|
    t.integer "eventID"
    t.integer "eventlistID"
    t.date "date"
    t.string "description"
    t.boolean "isMandatory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.time "time"
    t.string "location"
  end

  create_table "member_list", force: :cascade do |t|
    t.integer "memberID"
  end

  create_table "members", force: :cascade do |t|
    t.integer "memberID"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_hour_list", force: :cascade do |t|
    t.integer "servicehourlistID"
    t.integer "memberID"
  end

  create_table "service_hours", force: :cascade do |t|
    t.integer "servicehoursID"
    t.integer "servicehourlistID"
    t.date "date"
    t.float "hours"
    t.string "description"
    t.boolean "isApproved"
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
