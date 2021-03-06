# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_18_025333) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "products_count", default: 0
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.date "founded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "foreignname_id", null: false
    t.index ["foreignname_id"], name: "index_countries_on_foreignname_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "students_count", default: 0
    t.integer "status", limit: 2
    t.index ["status"], name: "index_courses_on_status"
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
    t.index ["student_id", "course_id"], name: "index_courses_students_on_student_id_and_course_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foreignnames", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.integer "counter", default: 0
    t.string "nick_name"
    t.string "prefix"
    t.string "full_name"
    t.string "origin"
    t.index ["nick_name"], name: "index_foreignnames_on_nick_name"
  end

  create_table "names", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "qty"
    t.decimal "price", precision: 5, scale: 2
    t.integer "status"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supervisor_id"
    t.index ["supervisor_id"], name: "index_teachers_on_supervisor_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.boolean "active"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supervisor_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["supervisor_id"], name: "index_users_on_supervisor_id"
  end

  add_foreign_key "countries", "foreignnames"
  add_foreign_key "products", "categories"
  add_foreign_key "users", "companies"
end
