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

ActiveRecord::Schema[8.0].define(version: 2025_07_25_012921) do
  create_table "clients", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.integer "user_id", null: false
    t.text "name", null: false
    t.string "client_secret", null: false
    t.text "support_url", null: false
    t.boolean "require_verification", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vetted", default: false
    t.boolean "featured", default: false
    t.string "description"
    t.index ["id"], name: "index_clients_on_id", unique: true
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "redirect_uris", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_redirect_uris_on_client_id"
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
    t.json "profile"
    t.boolean "verified"
    t.boolean "is_admin", default: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "verification_codes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verification_codes_on_user_id"
  end

  add_foreign_key "clients", "users"
  add_foreign_key "redirect_uris", "clients"
  add_foreign_key "sessions", "users"
  add_foreign_key "verification_codes", "users"
end
