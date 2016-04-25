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

ActiveRecord::Schema.define(version: 20160425185550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participant_credentials", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "uid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "participant_credentials", ["user_id"], name: "index_participant_credentials_on_user_id", using: :btree

  create_table "researcher_credentials", force: :cascade do |t|
    t.string   "description"
    t.string   "organization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "researcher_credentials", ["user_id"], name: "index_researcher_credentials_on_user_id", using: :btree

  create_table "snp_values", force: :cascade do |t|
    t.string   "base_pair"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
  end

  add_index "snp_values", ["location_id"], name: "index_snp_values_on_location_id", using: :btree

  create_table "snps", force: :cascade do |t|
    t.string   "snppable_type"
    t.integer  "snppable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "snp_value_id"
  end

  add_index "snps", ["snp_value_id"], name: "index_snps_on_snp_value_id", using: :btree
  add_index "snps", ["snppable_id"], name: "index_snps_on_snppable_id", using: :btree

  create_table "studies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "studies", ["user_id"], name: "index_studies_on_user_id", using: :btree

  create_table "study_participations", force: :cascade do |t|
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "study_participations", ["study_id"], name: "index_study_participations_on_study_id", using: :btree
  add_index "study_participations", ["user_id"], name: "index_study_participations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "participant_credentials", "users"
  add_foreign_key "researcher_credentials", "users"
  add_foreign_key "snp_values", "locations"
  add_foreign_key "snps", "snp_values"
  add_foreign_key "studies", "users"
  add_foreign_key "study_participations", "studies"
  add_foreign_key "study_participations", "users"
end
