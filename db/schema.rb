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

ActiveRecord::Schema.define(version: 2020_11_30_134048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "answer_content"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "predefined", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "form_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_form_questions_on_form_id"
    t.index ["question_id"], name: "index_form_questions_on_question_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.date "presented_on"
    t.string "presentation_key"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "speaker"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_content"
    t.string "question_topic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "question_type"
    t.boolean "predefined", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "form_questions", "forms"
  add_foreign_key "form_questions", "questions"
  add_foreign_key "forms", "users"
end
