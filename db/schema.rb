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

ActiveRecord::Schema[7.0].define(version: 2022_04_27_025032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "startDate"
    t.string "name"
    t.text "tee_time_window", default: [], array: true
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_events_on_course_id"
  end

  create_table "holes", force: :cascade do |t|
    t.string "yardage"
    t.integer "difficulty"
    t.string "nickname"
    t.text "about_text"
    t.integer "par"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_holes_on_course_id"
  end

  create_table "player_event_holes", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "hole_id", null: false
    t.bigint "player_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_player_event_holes_on_event_id"
    t.index ["hole_id"], name: "index_player_event_holes_on_hole_id"
    t.index ["player_id"], name: "index_player_event_holes_on_player_id"
  end

  create_table "player_events", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "event_id", null: false
    t.text "tee_time_windows", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_player_events_on_event_id"
    t.index ["player_id"], name: "index_player_events_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "courses"
  add_foreign_key "holes", "courses"
  add_foreign_key "player_event_holes", "events"
  add_foreign_key "player_event_holes", "holes"
  add_foreign_key "player_event_holes", "players"
  add_foreign_key "player_events", "events"
  add_foreign_key "player_events", "players"
end
