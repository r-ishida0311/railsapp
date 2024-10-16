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

ActiveRecord::Schema[7.1].define(version: 2024_10_16_105458) do
  create_table "affiliations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_equipment_on_category_id"
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "item"
    t.bigint "category_id", null: false
    t.bigint "equipment_id", null: false
    t.bigint "storage_id"
    t.bigint "shelf_id"
    t.bigint "affiliation_id", null: false
    t.integer "rental_fee"
    t.integer "pre_rental_fee"
    t.string "serial"
    t.integer "status"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_items_on_affiliation_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["equipment_id"], name: "index_items_on_equipment_id"
    t.index ["shelf_id"], name: "index_items_on_shelf_id"
    t.index ["storage_id"], name: "index_items_on_storage_id"
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.string "pgm"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reservations_on_item_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "shelves", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "storage_id", null: false
    t.string "shelf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_id"], name: "index_shelves_on_storage_id"
  end

  create_table "storages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "storage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "user_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "equipment", "categories"
  add_foreign_key "items", "affiliations"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "equipment"
  add_foreign_key "items", "shelves"
  add_foreign_key "items", "storages"
  add_foreign_key "reservations", "items"
  add_foreign_key "reservations", "users"
  add_foreign_key "shelves", "storages"
end
