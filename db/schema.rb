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

ActiveRecord::Schema.define(version: 20191226114901) do

  create_table "bin_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_bin_cards_on_card_id"
    t.index ["user_id"], name: "index_bin_cards_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "value"
    t.integer  "negative_points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "table_cards", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "row_id"
    t.integer  "place_in_a_row"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["card_id"], name: "index_table_cards_on_card_id"
  end

  create_table "temporary_card_places", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_temporary_card_places_on_card_id"
    t.index ["user_id"], name: "index_temporary_card_places_on_user_id"
  end

  create_table "user_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_user_cards_on_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "which_user"
  end

end
