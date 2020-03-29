# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_229_034_615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cart_items', force: :cascade do |t|
    t.bigint 'cart_id'
    t.bigint 'item_id'
    t.integer 'quantity', default: 1
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cart_id'], name: 'index_cart_items_on_cart_id'
    t.index ['item_id'], name: 'index_cart_items_on_item_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.float 'tax_slab'
  end

  create_table 'feedbacks', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.text 'message'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.decimal 'cost', precision: 8, scale: 2
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'brand'
    t.boolean 'restricted', default: false
    t.boolean 'age_restricted', default: false
    t.integer 'inventory'
    t.string 'image_url'
    t.bigint 'category_id'
    t.integer 'popularity', default: 0
    t.boolean 'disabled', default: false
    t.index ['category_id'], name: 'index_items_on_category_id'
  end

  create_table 'items_wishlists', id: false, force: :cascade do |t|
    t.bigint 'item_id', null: false
    t.bigint 'wishlist_id', null: false
    t.index ['item_id'], name: 'index_items_wishlists_on_item_id'
    t.index ['wishlist_id'], name: 'index_items_wishlists_on_wishlist_id'
  end

  create_table 'ledger_entries', force: :cascade do |t|
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.decimal 'total_cost'
    t.integer 'quantity'
    t.bigint 'user_id'
    t.bigint 'item_id'
    t.index ['item_id'], name: 'index_ledger_entries_on_item_id'
    t.index ['user_id'], name: 'index_ledger_entries_on_user_id'
  end

  create_table 'subscriber_lists', force: :cascade do |t|
    t.bigint 'item_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['item_id'], name: 'index_subscriber_lists_on_item_id'
  end

  create_table 'subscriber_lists_users', id: false, force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'subscriber_list_id', null: false
    t.index %w[subscriber_list_id user_id], name: 'index_subscriber_lists_users_on_subscriber_list_id_and_user_id'
    t.index %w[user_id subscriber_list_id], name: 'index_subscriber_lists_users_on_user_id_and_subscriber_list_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'is_admin', default: false
    t.string 'otp_secret_key'
    t.string 'phone_num'
    t.date 'dob'
    t.string 'address_l1'
    t.string 'address_l2'
    t.string 'city'
    t.string 'state'
    t.string 'zip'
    t.string 'card_name'
    t.string 'card_num'
    t.string 'card_expire'
    t.integer 'card_ccv'
    t.bigint 'subscriber_list_id'
    t.index ['subscriber_list_id'], name: 'index_users_on_subscriber_list_id'
  end

  create_table 'wishlists', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_wishlists_on_user_id'
  end

  add_foreign_key 'items', 'categories'
  add_foreign_key 'ledger_entries', 'items'
  add_foreign_key 'ledger_entries', 'users'
  add_foreign_key 'users', 'subscriber_lists'
  add_foreign_key 'wishlists', 'users'
end
