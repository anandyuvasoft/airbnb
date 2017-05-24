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

ActiveRecord::Schema.define(version: 20170524125014) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_read",                      default: false
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "awards", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.string   "name",       limit: 255
    t.date     "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "room_id",    limit: 4
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "friend_id",  limit: 4
  end

  add_index "bookings", ["room_id"], name: "index_bookings_on_room_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "breakthroughs", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.string   "name",       limit: 255
    t.date     "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 255
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.string   "school",     limit: 255
    t.date     "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "educations", ["room_id"], name: "index_educations_on_room_id", using: :btree

  create_table "friends", force: :cascade do |t|
    t.string   "fullname",     limit: 255
    t.string   "email",        limit: 255
    t.string   "phone_number", limit: 255
    t.datetime "birthday"
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "gender",       limit: 255
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "room_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "groups", ["room_id"], name: "index_groups_on_room_id", using: :btree
  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "insurance_providers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.integer  "group_id",     limit: 4
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.string   "token",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content",         limit: 65535
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "room_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "photos", ["room_id"], name: "index_photos_on_room_id", using: :btree

  create_table "procedures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "room_id",             limit: 4
    t.integer  "price",               limit: 4
    t.string   "name",                limit: 255
    t.boolean  "status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "notification_params", limit: 65535
    t.string   "transaction_id",      limit: 255
    t.datetime "purchased_at"
  end

  add_index "purchases", ["room_id"], name: "index_purchases_on_room_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "relations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relatives", force: :cascade do |t|
    t.string   "relation",     limit: 255
    t.string   "fullname",     limit: 255
    t.string   "email",        limit: 255
    t.string   "phone_number", limit: 255
    t.string   "gender",       limit: 255
    t.datetime "birthday"
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "relatives", ["user_id"], name: "index_relatives_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "room_id",    limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price",      limit: 4
    t.integer  "total",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "status"
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "comment",    limit: 65535
    t.integer  "star",       limit: 4,     default: 1
    t.integer  "room_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "reviews", ["room_id"], name: "index_reviews_on_room_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "address",         limit: 255
    t.integer  "price",           limit: 4
    t.text     "biography",       limit: 65535
    t.string   "practice",        limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.string   "website",         limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.float    "latitude",        limit: 24
    t.float    "longitude",       limit: 24
    t.boolean  "is_admin_active",               default: false
    t.datetime "opened_at"
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id", using: :btree

  create_table "rooms_conditions", force: :cascade do |t|
    t.integer  "room_id",      limit: 4
    t.integer  "condition_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "rooms_conditions", ["condition_id"], name: "index_rooms_conditions_on_condition_id", using: :btree
  add_index "rooms_conditions", ["room_id"], name: "index_rooms_conditions_on_room_id", using: :btree

  create_table "rooms_insurances", force: :cascade do |t|
    t.integer  "room_id",      limit: 4
    t.integer  "insurance_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "rooms_insurances", ["insurance_id"], name: "index_rooms_insurances_on_insurance_id", using: :btree
  add_index "rooms_insurances", ["room_id"], name: "index_rooms_insurances_on_room_id", using: :btree

  create_table "rooms_languages", force: :cascade do |t|
    t.integer  "room_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rooms_languages", ["language_id"], name: "index_rooms_languages_on_language_id", using: :btree
  add_index "rooms_languages", ["room_id"], name: "index_rooms_languages_on_room_id", using: :btree

  create_table "rooms_procedures", force: :cascade do |t|
    t.integer  "room_id",      limit: 4
    t.integer  "procedure_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "rooms_procedures", ["procedure_id"], name: "index_rooms_procedures_on_procedure_id", using: :btree
  add_index "rooms_procedures", ["room_id"], name: "index_rooms_procedures_on_room_id", using: :btree

  create_table "specialities", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.string   "speciality", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 255
  end

  add_index "symptoms", ["slug"], name: "index_symptoms_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "fullname",               limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "image",                  limit: 255
    t.string   "phone_number",           limit: 255
    t.text     "description",            limit: 65535
    t.string   "gender",                 limit: 255
    t.datetime "birthday"
    t.string   "type",                   limit: 255
    t.text     "biography",              limit: 65535
    t.string   "degree",                 limit: 255
    t.integer  "license",                limit: 4
    t.string   "category",               limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings", "users"
  add_foreign_key "educations", "rooms"
  add_foreign_key "friends", "users"
  add_foreign_key "groups", "rooms"
  add_foreign_key "groups", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "rooms"
  add_foreign_key "purchases", "rooms"
  add_foreign_key "purchases", "users"
  add_foreign_key "relatives", "users"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "reviews", "users"
  add_foreign_key "rooms", "users"
  add_foreign_key "rooms_conditions", "conditions"
  add_foreign_key "rooms_conditions", "rooms"
  add_foreign_key "rooms_insurances", "insurances"
  add_foreign_key "rooms_insurances", "rooms"
  add_foreign_key "rooms_languages", "languages"
  add_foreign_key "rooms_languages", "rooms"
  add_foreign_key "rooms_procedures", "procedures"
  add_foreign_key "rooms_procedures", "rooms"
end
