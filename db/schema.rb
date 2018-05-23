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

ActiveRecord::Schema.define(version: 20180523161118) do

  create_table "access_levels", force: :cascade do |t|
    t.integer "level"
    t.string "description"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "unp"
    t.string "description"
    t.string "name"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "telegram"
    t.string "whatsapp"
    t.string "address"
    t.integer "entity_id"
    t.string "entity_type"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade"
    t.decimal "rate", precision: 2, scale: 2
  end

  create_table "personal_numbers", force: :cascade do |t|
    t.string "number"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 5, scale: 2
    t.integer "grade_id"
  end

  create_table "worked_times", force: :cascade do |t|
    t.integer "user_id"
    t.date "start_date"
    t.date "end_date"
  end

end
