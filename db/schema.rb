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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161217052605) do

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "employer"
    t.string   "job"
    t.string   "emergency_one"
    t.string   "emergency_phone_one"
    t.string   "emergency_relationship_one"
    t.string   "emergency_two"
    t.string   "emergency_phone_two"
    t.string   "emergency_relationship_two"
    t.string   "reference_one"
    t.string   "reference_phone_one"
    t.string   "reference_address_one"
    t.string   "reference_city_one"
    t.string   "reference_state_one"
    t.string   "reference_zip_one"
    t.string   "reference_two"
    t.string   "reference_phtwo_two"
    t.string   "reference_address_two"
    t.string   "reference_city_two"
    t.string   "reference_state_two"
    t.string   "reference_zip_two"
    t.string   "reference_three"
    t.string   "reference_phthree_three"
    t.string   "reference_address_three"
    t.string   "reference_city_three"
    t.string   "reference_state_three"
    t.string   "reference_zip_three"
    t.boolean  "phyiscal_shape"
    t.text     "explain_physical"
    t.boolean  "first_aid"
    t.string   "first_aid_issued"
    t.string   "certifications"
    t.string   "special_skills"
    t.boolean  "license"
    t.boolean  "felony"
    t.boolean  "felony_conviction"
    t.text     "primary_reason"
    t.boolean  "liability"
    t.boolean  "acknowledge"
    t.datetime "photo_taken_at"
    t.datetime "waiver_signed_at"
    t.datetime "dues_paid_at"
    t.datetime "approved_at"
    t.datetime "d4h"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carpools", force: :cascade do |t|
    t.string   "event"
    t.string   "address"
    t.string   "notes"
    t.time     "depart"
    t.time     "return"
    t.integer  "seats_offered"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.date     "event_date"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "discussion_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "discussions", force: :cascade do |t|
    t.text     "body"
    t.string   "subject"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "category"
    t.string   "description"
    t.string   "expiration"
    t.string   "importance"
    t.string   "notes"
    t.string   "status"
    t.integer  "quantity"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "description"
    t.string   "category"
    t.string   "address"
    t.string   "weather"
    t.string   "notes"
    t.string   "miles"
    t.string   "name"
    t.string   "link"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "path"
    t.string   "type"
    t.string   "page"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.string   "path"
    t.string   "page"
    t.string   "width"
    t.string   "height"
    t.integer  "rank"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "incidents", force: :cascade do |t|
    t.integer  "d4h_id"
    t.string   "reference"
    t.text     "description"
    t.string   "lat"
    t.string   "lng"
    t.integer  "attendance_percent"
    t.integer  "attendance"
    t.integer  "distance"
    t.datetime "end_on"
    t.datetime "start_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "image"
    t.string   "image_big"
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "application_id"
    t.integer  "status_id"
    t.boolean  "on_call"
    t.integer  "d4h_id"
    t.string   "reference"
    t.date     "birthday"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "emergency_one"
    t.string   "emergency_phone_one"
    t.string   "emergency_relationship_one"
    t.string   "emergency_two"
    t.string   "emergency_phone_two"
    t.string   "emergency_relationship_two"
    t.datetime "updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.boolean  "active"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", force: :cascade do |t|
    t.date     "event_date"
    t.string   "description"
    t.string   "event"
    t.string   "notes"
    t.integer  "claimed_by"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "body"
    t.string   "search_date"
    t.boolean  "active"
    t.integer  "creatd_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "carpool_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "sponsor_url"
    t.string   "image"
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.string   "role",            default: "f"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",       default: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string   "repeats"
    t.string   "notes"
    t.integer  "member_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
