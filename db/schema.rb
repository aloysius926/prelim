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

ActiveRecord::Schema.define(version: 20140108020035) do

  create_table "answer_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.integer  "overall"
    t.integer  "clarity"
    t.integer  "detail"
    t.integer  "correctness"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

  add_index "answer_ratings", ["answer_id"], name: "index_answer_ratings_on_answer_id"
  add_index "answer_ratings", ["user_id"], name: "index_answer_ratings_on_user_id"

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "finished_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finished_questions", ["question_id"], name: "index_finished_questions_on_question_id"
  add_index "finished_questions", ["user_id"], name: "index_finished_questions_on_user_id"

  create_table "professors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_ratings", force: true do |t|
    t.integer  "uniqueness"
    t.integer  "difficulty"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "overall"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_ratings", ["question_id"], name: "index_question_ratings_on_question_id"
  add_index "question_ratings", ["user_id"], name: "index_question_ratings_on_user_id"

  create_table "questions", force: true do |t|
    t.integer  "subject_id"
    t.integer  "source_id"
    t.integer  "professor_id"
    t.integer  "mini"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  add_index "questions", ["professor_id"], name: "index_questions_on_professor_id"
  add_index "questions", ["source_id"], name: "index_questions_on_source_id"
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"

  create_table "questiontags", force: true do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questiontags", ["question_id"], name: "index_questiontags_on_question_id"
  add_index "questiontags", ["tag_id"], name: "index_questiontags_on_tag_id"

  create_table "rating_options", force: true do |t|
    t.string  "label"
    t.integer "value"
  end

  create_table "sittings", force: true do |t|
    t.integer  "term_id"
    t.integer  "year"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  add_index "sittings", ["question_id"], name: "index_sittings_on_question_id"
  add_index "sittings", ["term_id"], name: "index_sittings_on_term_id"

  create_table "sources", force: true do |t|
    t.text     "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.text     "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.text     "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
