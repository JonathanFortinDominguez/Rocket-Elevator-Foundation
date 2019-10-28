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

ActiveRecord::Schema.define(version: 2019_10_16_173227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", force: :cascade do |t|
    t.string "business_name"
    t.string "contact_full_name"
    t.string "contact_email"
    t.integer "nbelevator"
    t.string "client_city"
    t.datetime "creation_date"
  end

  create_table "factcontacts", force: :cascade do |t|
    t.integer "contactid"
    t.string "business_name"
    t.string "email"
    t.string "project_name"
    t.datetime "creation_date"
  end

  create_table "factelevators", force: :cascade do |t|
    t.integer "elevatorid"
    t.string "serial_number"
    t.integer "buildingid"
    t.integer "customer"
    t.string "building_city"
    t.datetime "deploy_date"
  end

  create_table "factquotes", force: :cascade do |t|
    t.integer "quoteid"
    t.string "business_name"
    t.string "email"
    t.integer "nbelevator"
    t.datetime "creation_date"
  end

  create_table "tests", force: :cascade do |t|
    t.text "test"
  end

end
