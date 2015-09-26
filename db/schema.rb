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

ActiveRecord::Schema.define(version: 20150913174742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

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

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "admin_users", ["authentication_token"], name: "index_admin_users_on_authentication_token", using: :btree
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "country"
    t.string   "region"
    t.string   "address"
    t.string   "postal"
    t.string   "phone"
    t.string   "email"
    t.integer  "rank"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "published",    default: false
    t.integer  "franchise_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "zone_id"
  end

  add_index "bars", ["franchise_id"], name: "index_bars_on_franchise_id", using: :btree
  add_index "bars", ["zone_id"], name: "index_bars_on_zone_id", using: :btree

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

  add_index "brands_types", ["brand_id"], name: "index_brands_types_on_brand_id", using: :btree
  add_index "brands_types", ["type_id"], name: "index_brands_types_on_type_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "favorite_brands", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorite_brands", ["brand_id"], name: "index_favorite_brands_on_brand_id", using: :btree
  add_index "favorite_brands", ["user_id"], name: "index_favorite_brands_on_user_id", using: :btree

  create_table "favorite_zones", force: :cascade do |t|
    t.integer  "zone_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorite_zones", ["user_id"], name: "index_favorite_zones_on_user_id", using: :btree
  add_index "favorite_zones", ["zone_id"], name: "index_favorite_zones_on_zone_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "bar_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["bar_id"], name: "index_favorites_on_bar_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opinions", force: :cascade do |t|
    t.string   "comment"
    t.boolean  "published",  default: false
    t.integer  "bar_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "opinions", ["bar_id"], name: "index_opinions_on_bar_id", using: :btree
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.decimal  "price",        precision: 10, scale: 2, default: 0.0,   null: false
    t.boolean  "published",                             default: false
    t.integer  "brand_id"
    t.integer  "size_id"
    t.integer  "franchise_id"
    t.integer  "bar_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "products", ["bar_id"], name: "index_products_on_bar_id", using: :btree
  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["franchise_id"], name: "index_products_on_franchise_id", using: :btree
  add_index "products", ["size_id"], name: "index_products_on_size_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "title",       default: "",    null: false
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
    t.boolean  "published",   default: false
    t.integer  "bar_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "promotions", ["bar_id"], name: "index_promotions_on_bar_id", using: :btree

  create_table "ranks", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ranks", ["bar_id"], name: "index_ranks_on_bar_id", using: :btree
  add_index "ranks", ["user_id"], name: "index_ranks_on_user_id", using: :btree

  create_table "recent_brands", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recent_brands", ["brand_id"], name: "index_recent_brands_on_brand_id", using: :btree
  add_index "recent_brands", ["user_id"], name: "index_recent_brands_on_user_id", using: :btree

  create_table "recent_zones", force: :cascade do |t|
    t.integer  "zone_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recent_zones", ["user_id"], name: "index_recent_zones_on_user_id", using: :btree
  add_index "recent_zones", ["zone_id"], name: "index_recent_zones_on_zone_id", using: :btree

  create_table "recents", force: :cascade do |t|
    t.integer  "bar_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recents", ["bar_id"], name: "index_recents_on_bar_id", using: :btree
  add_index "recents", ["user_id"], name: "index_recents_on_user_id", using: :btree

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
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "push_uid"
    t.string   "facebook_uid"
    t.string   "google_uid"
    t.string   "email"
    t.string   "username"
    t.string   "publicname"
    t.string   "avatar"
    t.string   "gender"
    t.string   "country"
    t.string   "city"
    t.date     "birth"
    t.boolean  "active"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "custom_avatar"
    t.datetime "last_connection_date", default: '2015-08-02 10:54:28'
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["facebook_uid"], name: "index_users_on_facebook_uid", unique: true, using: :btree
  add_index "users", ["google_uid"], name: "index_users_on_google_uid", unique: true, using: :btree
  add_index "users", ["push_uid"], name: "index_users_on_push_uid", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.string   "geometry"
    t.string   "city"
    t.string   "country",    default: "ES"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
  end

  add_foreign_key "bars", "zones"
  add_foreign_key "brands_types", "brands"
  add_foreign_key "brands_types", "types"
end
