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

ActiveRecord::Schema.define(:version => 20121119134341) do

  create_table "drivers", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "remarks"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "to_from"
    t.date     "event_date"
    t.time     "event_time"
    t.string   "location"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "occupants", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "remarks"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
    t.string   "role"
    t.string   "first_name"
    t.string   "surname"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.boolean  "change_password"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "facebook_id"
    t.string   "gravatar_hash"
  end

end
