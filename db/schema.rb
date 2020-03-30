# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_30_201215) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "post_attachments", force: :cascade do |t|
    t.integer "post_id"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "ad_title"
    t.integer "category_id"
    t.text "ad_description"
    t.string "user_name"
    t.string "phone"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "approved_by", default: "null"
    t.string "detailed_ad_title"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "approved_by", default: "null"
    t.integer "post_id"
    t.string "email"
    t.string "location"
    t.string "rating"
    t.index ["post_id"], name: "index_reviews_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin"
    t.string "provider"
    t.string "uid"
    t.string "location"
  end

  add_foreign_key "posts", "users"
  add_foreign_key "reviews", "posts"
end
