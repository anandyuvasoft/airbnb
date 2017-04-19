# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170417193517) do

  create_table "conditions", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conditions", ["room_id"], name: "index_conditions_on_room_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "school"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["room_id"], name: "index_educations_on_room_id"

  create_table "insurances", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "insurance_provider"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "insurances", ["room_id"], name: "index_insurances_on_room_id"

  create_table "languages", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["room_id"], name: "index_languages_on_room_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["room_id"], name: "index_photos_on_room_id"

  create_table "procedures", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "procedure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "procedures", ["room_id"], name: "index_procedures_on_room_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "price"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["room_id"], name: "index_purchases_on_room_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",       default: 1
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "reviews", ["room_id"], name: "index_reviews_on_room_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "listing_name"
    t.text     "summary"
    t.string   "address"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.integer  "price"
    t.boolean  "active"
    t.string   "degree"
    t.string   "gender"
    t.string   "medical_license_number"
    t.string   "category"
    t.text     "biography"
    t.text     "education"
    t.string   "practice"
    t.string   "phone"
    t.string   "email"
    t.boolean  "accepting_insurance"
    t.text     "languages"
    t.text     "board_certifications"
    t.text     "specialities"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "specialities", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
    t.string   "account_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
