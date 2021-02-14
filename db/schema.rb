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

ActiveRecord::Schema.define(version: 2021_02_14_042847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "availability_duration_id"
    t.date "available_on"
    t.time "from_time"
    t.time "to_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "booked_service_id"
    t.bigint "provider_id"
    t.index ["availability_duration_id"], name: "index_availabilities_on_availability_duration_id"
    t.index ["booked_service_id"], name: "index_availabilities_on_booked_service_id"
    t.index ["provider_id"], name: "index_availabilities_on_provider_id"
  end

  create_table "availability_durations", force: :cascade do |t|
    t.bigint "provider_id"
    t.date "starting_date"
    t.time "from_time"
    t.time "to_time"
    t.string "repetition_days", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "repetition"
    t.integer "slots_offset"
    t.index ["provider_id"], name: "index_availability_durations_on_provider_id"
  end

  create_table "booked_services", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "provided_service_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booked_services_on_booking_id"
    t.index ["provided_service_id"], name: "index_booked_services_on_provided_service_id"
  end

  create_table "booking_requests", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "status", default: 0
    t.index ["customer_id"], name: "index_booking_requests_on_customer_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "status", default: 0
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "postal_code"
    t.string "city"
    t.string "street"
    t.string "country"
    t.string "token_expires_at"
    t.string "phone_number"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "investors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "website"
    t.string "country"
    t.string "state"
    t.string "syndicate_group"
    t.string "group_name"
    t.string "organization_name"
    t.string "investment_stages", default: [], array: true
    t.string "last_investment_stages", default: [], array: true
    t.string "investment_rates"
    t.string "investment_category", default: [], array: true
    t.string "investment_industry", default: [], array: true
    t.string "emerging_technologies", default: [], array: true
    t.string "previous_emerging_technologies", default: [], array: true
    t.string "founder_type"
    t.string "about_us"
  end

  create_table "provided_services", force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "service_id"
    t.decimal "price", precision: 10, scale: 2
    t.text "service_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: true
    t.index ["provider_id"], name: "index_provided_services_on_provider_id"
    t.index ["service_id"], name: "index_provided_services_on_service_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "first_name"
    t.string "email", default: "", null: false
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "profile_description"
    t.integer "base_price"
    t.string "postal_code"
    t.string "city"
    t.string "street"
    t.string "country"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "token_expires_at"
    t.index ["email"], name: "index_providers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true
  end

  create_table "requested_services", force: :cascade do |t|
    t.bigint "provided_service_id"
    t.bigint "booking_request_id"
    t.bigint "availability_id"
    t.index ["availability_id"], name: "index_requested_services_on_availability_id"
    t.index ["booking_request_id"], name: "index_requested_services_on_booking_request_id"
    t.index ["provided_service_id"], name: "index_requested_services_on_provided_service_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booked_service_id"
    t.text "comments"
    t.integer "ratings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booked_service_id"], name: "index_reviews_on_booked_service_id", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "availabilities", "availability_durations", on_delete: :cascade
  add_foreign_key "availabilities", "booked_services", on_delete: :cascade
  add_foreign_key "availabilities", "providers", on_delete: :cascade
  add_foreign_key "availability_durations", "providers", on_delete: :cascade
  add_foreign_key "booked_services", "bookings", on_delete: :cascade
  add_foreign_key "booked_services", "provided_services", on_delete: :cascade
  add_foreign_key "booking_requests", "customers", on_delete: :cascade
  add_foreign_key "bookings", "customers", on_delete: :cascade
  add_foreign_key "provided_services", "providers", on_delete: :cascade
  add_foreign_key "provided_services", "services", on_delete: :cascade
  add_foreign_key "requested_services", "availabilities", on_delete: :cascade
  add_foreign_key "requested_services", "booking_requests", on_delete: :cascade
  add_foreign_key "requested_services", "provided_services", on_delete: :cascade
  add_foreign_key "reviews", "booked_services", on_delete: :cascade
end
