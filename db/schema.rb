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

ActiveRecord::Schema.define(version: 2020_02_22_060938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "item_id"
    t.bigint "ledger_entry_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["ledger_entry_id"], name: "index_cart_items_on_ledger_entry_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "tax_slab"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "cost", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand"
    t.boolean "restricted", default: false
    t.boolean "age_restricted", default: false
    t.integer "inventory"
    t.string "image_url"
    t.bigint "category_id"
    t.integer "popularity", default: 0
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "ledger_entries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items_wishlists", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "wishlist_id", null: false
    t.index ["item_id"], name: "index_items_wishlists_on_item_id"
    t.index ["wishlist_id"], name: "index_items_wishlists_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
    t.string "otp_secret_key"
    t.string "phone_num"
    t.date "dob"
    t.string "address_l1"
    t.string "address_l2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "card_name"
    t.string "card_num"
    t.string "card_expire"
    t.integer "card_ccv"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "items", "categories"
  add_foreign_key "wishlists", "users"
end
