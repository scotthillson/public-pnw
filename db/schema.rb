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

ActiveRecord::Schema.define(version: 20170311020548) do

  create_table "activities", force: :cascade do |t|
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
    t.string   "gridref"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "activity_type"
  end

  create_table "carpools", force: :cascade do |t|
    t.string   "event",         limit: 255
    t.string   "address",       limit: 255
    t.string   "notes",         limit: 255
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

  create_table "d4hs", force: :cascade do |t|
    t.datetime "last_activity_sync"
    t.datetime "last_group_sync"
    t.datetime "last_member_sync"
    t.datetime "last_incident_sync"
    t.datetime "last_search_sync"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "discussions", force: :cascade do |t|
    t.text     "body"
    t.string   "subject",    limit: 255
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "description",           limit: 255
    t.string   "expiration",            limit: 255
    t.string   "importance",            limit: 255
    t.string   "notes",                 limit: 255
    t.string   "status",                limit: 255
    t.integer  "quantity"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "examples"
    t.integer  "equipment_category_id"
    t.integer  "team_gear"
    t.integer  "weight"
    t.integer  "sort"
    t.integer  "updated_by"
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "display_name"
    t.string   "team_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "sort"
  end

  create_table "events", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "category",    limit: 255
    t.string   "address",     limit: 255
    t.string   "weather",     limit: 255
    t.string   "notes",       limit: 255
    t.string   "miles",       limit: 255
    t.string   "name",        limit: 255
    t.string   "link",        limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "d4h_id"
    t.string   "reference"
    t.string   "lat"
    t.string   "lng"
    t.datetime "start_on"
    t.datetime "end_on"
    t.integer  "activity_id"
    t.string   "gridref"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "event_type"
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
    t.integer  "d4h_id"
    t.string   "local_name"
    t.string   "equipment_note"
  end

  create_table "images", force: :cascade do |t|
    t.string   "filename",   limit: 255
    t.string   "path",       limit: 255
    t.string   "page",       limit: 255
    t.string   "width",      limit: 255
    t.string   "height",     limit: 255
    t.integer  "rank"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "incident_members", force: :cascade do |t|
    t.string   "role"
    t.string   "status",      default: "unknown"
    t.integer  "incident_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", force: :cascade do |t|
    t.integer  "d4h_id"
    t.string   "reference"
    t.text     "description"
    t.string   "lat"
    t.string   "lng"
    t.datetime "end_on"
    t.datetime "start_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "utm"
    t.datetime "alerted"
    t.datetime "mobile"
    t.datetime "at_base"
    t.datetime "return_to_base"
    t.datetime "leave_base"
    t.datetime "home_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "title",                      limit: 255
    t.string   "image",                      limit: 255
    t.string   "image_big",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "email"
    t.string   "position"
    t.datetime "duty_start"
    t.datetime "duty_end"
    t.integer  "team_id"
    t.integer  "duty_type"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sid"
    t.datetime "date_created"
    t.datetime "date_updated"
    t.datetime "date_sent"
    t.string   "account"
    t.string   "messaging_service_sid"
    t.string   "from"
    t.string   "to"
    t.string   "body"
    t.string   "num_media"
    t.string   "num_segments"
    t.string   "status"
    t.string   "error_code"
    t.string   "error_message"
    t.string   "direction"
    t.string   "price"
    t.string   "price_unit"
    t.string   "api_version"
    t.string   "uri"
    t.string   "subresource_uri"
    t.string   "local_status"
    t.string   "translation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "body",       limit: 255
    t.integer  "active"
    t.integer  "created_by", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "body",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.integer  "created_by"
  end

  create_table "prospect_applications", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "address"
    t.string   "city"
    t.string   "address_state"
    t.string   "postal"
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
    t.string   "reference_postal_one"
    t.string   "reference_two"
    t.string   "reference_phone_two"
    t.string   "reference_address_two"
    t.string   "reference_city_two"
    t.string   "reference_state_two"
    t.string   "reference_postal_two"
    t.string   "reference_three"
    t.string   "reference_phone_three"
    t.string   "reference_address_three"
    t.string   "reference_city_three"
    t.string   "reference_state_three"
    t.string   "reference_postal_three"
    t.boolean  "physical_shape"
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
    t.string   "status"
    t.integer  "approved_by"
  end

  create_table "rentals", force: :cascade do |t|
    t.date     "event_date"
    t.string   "description", limit: 255
    t.string   "event",       limit: 255
    t.string   "notes",       limit: 255
    t.integer  "claimed_by"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "carpool_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "sponsor_url", limit: 255
    t.string   "image",       limit: 255
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.integer  "group_id"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "token",           limit: 255
    t.string   "role",                        default: "member"
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",                   default: false
  end

end
