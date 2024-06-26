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

ActiveRecord::Schema[7.1].define(version: 2024_05_10_142412) do
  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.float "price"
    t.string "id_icon"
    t.float "volume_1hrs"
    t.float "volume_1day"
    t.float "volume_1mth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallet_cryptos", force: :cascade do |t|
    t.integer "wallet_id", null: false
    t.integer "crypto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_wallet_cryptos_on_crypto_id"
    t.index ["wallet_id"], name: "index_wallet_cryptos_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "wallet_cryptos", "cryptos"
  add_foreign_key "wallet_cryptos", "wallets"
  add_foreign_key "wallets", "users"
end
