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

ActiveRecord::Schema.define(version: 20160616175032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "credentials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "note"
    t.string   "link"
  end

  create_table "credentials_roles", id: false, force: :cascade do |t|
    t.integer "credential_id"
    t.integer "role_id"
  end

  add_index "credentials_roles", ["credential_id"], name: "index_credentials_roles_on_credential_id", using: :btree
  add_index "credentials_roles", ["role_id"], name: "index_credentials_roles_on_role_id", using: :btree

  create_table "role_credentials", force: :cascade do |t|
    t.integer "credential_id"
    t.integer "role_id"
  end

  add_index "role_credentials", ["credential_id"], name: "index_role_credentials_on_credential_id", using: :btree
  add_index "role_credentials", ["role_id"], name: "index_role_credentials_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_credentials", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "credential_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "teacher_credentials", ["credential_id"], name: "index_teacher_credentials_on_credential_id", using: :btree
  add_index "teacher_credentials", ["teacher_id"], name: "index_teacher_credentials_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "grade_level"
    t.boolean  "special_education"
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "certificate_status"
    t.string   "certificate_location"
    t.string   "email"
  end

  add_index "teachers", ["role_id"], name: "index_teachers_on_role_id", using: :btree

  add_foreign_key "teacher_credentials", "credentials"
  add_foreign_key "teacher_credentials", "teachers"
  add_foreign_key "teachers", "roles"
end
