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

ActiveRecord::Schema.define(version: 20150504212231) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "country"
    t.string   "region"
    t.string   "address"
    t.string   "postal"
    t.string   "phone"
    t.integer  "rank"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "published",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "image"
    t.string   "alt_image"
    t.string   "shadow_image"
    t.boolean  "published",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "brands_types", force: :cascade do |t|
    t.integer  "type_id"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "brands_types", ["brand_id"], name: "index_brands_types_on_brand_id"
  add_index "brands_types", ["type_id"], name: "index_brands_types_on_type_id"

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.float    "price"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title",       default: "", null: false
    t.text     "description"
    t.string   "image"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_hour"
    t.time     "end_hour"
    t.boolean  "recurrent"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.integer  "icon"
    t.integer  "volume"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid"
    t.string   "username",               default: "",    null: false
    t.string   "publicname"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "avatar"
    t.string   "gender"
    t.string   "country"
    t.string   "city"
    t.date     "birth"
    t.string   "active"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
