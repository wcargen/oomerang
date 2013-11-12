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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131112032555) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "model"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "found_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "category_id"
    t.string   "item_color"
    t.text     "item_details"
    t.date     "date"
    t.time     "time"
    t.text     "secret_info"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.text     "address"
    t.string   "placename"
    t.float    "latitude"
    t.float    "longtitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lost_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "category_id"
    t.string   "item_color"
    t.text     "item_details"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "seeker_user_id"
    t.integer  "finder_user_id"
    t.integer  "lost_item_id"
    t.integer  "found_item_id"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
