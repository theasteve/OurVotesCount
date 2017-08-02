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

ActiveRecord::Schema.define(version: 20170801191150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "protest_id"
    t.index ["protest_id"], name: "index_attendances_on_protest_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "transportation_id"
    t.index ["transportation_id"], name: "index_passengers_on_transportation_id"
    t.index ["user_id", "transportation_id"], name: "index_passengers_on_user_id_and_transportation_id", unique: true
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "protests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.datetime "starts_at"
    t.bigint "creator_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["creator_id"], name: "index_protests_on_creator_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.string "pickup_location"
    t.string "vehicle"
    t.integer "capacity"
    t.bigint "destination_id"
    t.bigint "transporter_id"
    t.index ["destination_id"], name: "index_transportations_on_destination_id"
    t.index ["transporter_id"], name: "index_transportations_on_transporter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "protests", "users", column: "creator_id"
end
