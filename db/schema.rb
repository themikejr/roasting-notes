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

ActiveRecord::Schema.define(version: 20180217150724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.bigint "origin_id"
    t.integer "batch_number"
    t.integer "roast_length"
    t.integer "turning_point"
    t.integer "dry_end"
    t.integer "first_crack_start"
    t.integer "first_crack_end"
    t.integer "second_crack_start"
    t.integer "second_crack_end"
    t.float "dry_time"
    t.float "dry_time_percentage"
    t.float "malliard_time"
    t.float "malliard_time_percentage"
    t.float "development_time"
    t.float "development_time_percentage"
    t.float "charge_temp"
    t.float "drop_temp"
    t.string "artisan_json"
    t.string "roast_length_pretty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "roast_date"
    t.integer "start_weight"
    t.integer "end_weight"
    t.string "artisan_image_id"
    t.string "artisan_image_filename"
    t.string "artisan_image_content_size"
    t.string "artisan_image_content_type"
    t.index ["origin_id"], name: "index_batches_on_origin_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "country"
    t.string "processing_type"
    t.integer "elevation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastings", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "user_id"
    t.bigint "origin_id"
    t.float "dry_fragrance"
    t.float "wet_aroma"
    t.float "flavor"
    t.float "aftertaste"
    t.float "acidity"
    t.float "body"
    t.float "balance"
    t.float "sweetness"
    t.float "uniformity"
    t.float "cleanliness"
    t.float "total_score"
    t.string "nose_notes"
    t.string "mouth_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_tastings_on_batch_id"
    t.index ["origin_id"], name: "index_tastings_on_origin_id"
    t.index ["user_id"], name: "index_tastings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tastings", "batches"
  add_foreign_key "tastings", "users"
end
