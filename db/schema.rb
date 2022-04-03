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

ActiveRecord::Schema.define(version: 2022_03_07_230810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.boolean "isLocked", default: false
  end

  create_table "events_members", id: false, force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_events_members_on_event_id"
    t.index ["member_id"], name: "index_events_members_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isAdmin"
    t.string "email"
  end

  create_table "services", force: :cascade do |t|
    t.integer "member_id"
    t.date "date"
    t.string "description"
    t.integer "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isApproved"
  end

  create_table "whitelists", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
