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

ActiveRecord::Schema[7.0].define(version: 2023_05_13_180902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gps_enabled"
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

  create_table "good_job_processes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "state"
  end

  create_table "good_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "queue_name"
    t.integer "priority"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at", precision: nil
    t.datetime "performed_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id"
    t.text "concurrency_key"
    t.text "cron_key"
    t.uuid "retried_good_job_id"
    t.datetime "cron_at", precision: nil
    t.index ["active_job_id", "created_at"], name: "index_good_jobs_on_active_job_id_and_created_at"
    t.index ["active_job_id"], name: "index_good_jobs_on_active_job_id"
    t.index ["concurrency_key"], name: "index_good_jobs_on_concurrency_key_when_unfinished", where: "(finished_at IS NULL)"
    t.index ["cron_key", "created_at"], name: "index_good_jobs_on_cron_key_and_created_at"
    t.index ["cron_key", "cron_at"], name: "index_good_jobs_on_cron_key_and_cron_at", unique: true
    t.index ["finished_at"], name: "index_good_jobs_jobs_on_finished_at", where: "((retried_good_job_id IS NULL) AND (finished_at IS NOT NULL))"
    t.index ["queue_name", "scheduled_at"], name: "index_good_jobs_on_queue_name_and_scheduled_at", where: "(finished_at IS NULL)"
    t.index ["scheduled_at"], name: "index_good_jobs_on_scheduled_at", where: "(finished_at IS NULL)"
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
    t.integer "number"
    t.integer "handicap"
    t.string "green_long"
    t.string "green_lat"
    t.index ["course_id"], name: "index_holes_on_course_id"
  end

  create_table "player_event_holes", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "hole_id", null: false
    t.bigint "player_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_event_id", null: false
    t.boolean "hole_complete"
    t.integer "over_par"
    t.index ["event_id"], name: "index_player_event_holes_on_event_id"
    t.index ["hole_id"], name: "index_player_event_holes_on_hole_id"
    t.index ["player_event_id"], name: "index_player_event_holes_on_player_event_id"
    t.index ["player_id"], name: "index_player_event_holes_on_player_id"
  end

  create_table "player_events", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "event_id", null: false
    t.text "tee_time_windows", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "completed_holes", default: 0
    t.boolean "round_complete"
    t.integer "strokes_to_par", default: 0
    t.index ["event_id"], name: "index_player_events_on_event_id"
    t.index ["player_id"], name: "index_player_events_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "handicap"
  end

  create_table "tournament_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tournament_events_on_event_id"
    t.index ["tournament_id"], name: "index_tournament_events_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "courses"
  add_foreign_key "holes", "courses"
  add_foreign_key "player_event_holes", "events"
  add_foreign_key "player_event_holes", "holes"
  add_foreign_key "player_event_holes", "player_events"
  add_foreign_key "player_event_holes", "players"
  add_foreign_key "player_events", "events"
  add_foreign_key "player_events", "players"
  add_foreign_key "tournament_events", "events"
  add_foreign_key "tournament_events", "tournaments"
end
