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

ActiveRecord::Schema.define(version: 2021_04_10_085703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number"
    t.string "website"
    t.string "country", null: false
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
    t.string "startup_selected", default: [], array: true
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "startups", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number"
    t.string "website"
    t.string "country", null: false
    t.string "company_name", null: false
    t.string "state"
    t.string "part_of_accelerator"
    t.string "accelarator_name"
    t.string "investment_stages", default: [], array: true
    t.string "last_investment_stages", default: [], array: true
    t.string "investment_rates"
    t.string "previous_investment_rates"
    t.string "investment_category", default: [], array: true
    t.string "investment_industry", default: [], array: true
    t.string "emerging_technologies", default: [], array: true
    t.string "previous_emerging_technologies", default: [], array: true
    t.string "investor_type"
    t.string "value_preposition"
    t.string "competitors"
    t.string "additional_comments"
    t.string "about_us"
    t.string "investor_selected", default: [], array: true
    t.string "founders_information", default: ""
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
