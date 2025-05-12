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

ActiveRecord::Schema[8.0].define(version: 2025_05_12_182036) do
  create_table "radius_authorization_requests", force: :cascade do |t|
    t.string "calledStationId"
    t.string "callingStationId"
    t.string "accountingSessionId"
    t.string "accountingMultiSessionId"
    t.string "username"
    t.integer "authorization_status", default: 0
    t.integer "radius_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["radius_user_id"], name: "index_radius_authorization_requests_on_radius_user_id"
  end

  create_table "radius_post_authorizations", force: :cascade do |t|
    t.string "calledStationId"
    t.string "callingStationId"
    t.string "accountingSessionId"
    t.string "accountingMultiSessionId"
    t.string "username"
    t.integer "authorization_status", default: 0
    t.integer "radius_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["radius_user_id"], name: "index_radius_post_authorizations_on_radius_user_id"
  end

  create_table "radius_users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "radius_authorization_requests", "radius_users"
  add_foreign_key "radius_post_authorizations", "radius_users"
  add_foreign_key "sessions", "users"
end
