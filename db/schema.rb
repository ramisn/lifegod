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

ActiveRecord::Schema.define(version: 2021_01_24_082827) do

  create_table "collections", force: :cascade do |t|
    t.string "cl_date"
    t.string "location"
    t.integer "tag_id"
    t.string "name"
    t.float "amount"
    t.float "balance"
    t.float "fix_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "collection_type"
  end

  create_table "construction_expenses", force: :cascade do |t|
    t.text "material_description"
    t.float "amount"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expense_type"
    t.text "description"
    t.float "amount"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

  create_table "families", force: :cascade do |t|
    t.string "fam_name"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_families_on_location_id"
  end

  create_table "invens", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "loc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testpages", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "comments"
    t.string "status"
    t.string "misc"
    t.text "preferences"
    t.boolean "terms"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
