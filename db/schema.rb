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

ActiveRecord::Schema.define(version: 20140112205332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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

  add_index "answer_ratings", ["answer_id"], name: "index_answer_ratings_on_answer_id", using: :btree
  add_index "answer_ratings", ["user_id"], name: "index_answer_ratings_on_user_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "typed",            default: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "finished_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finished_questions", ["question_id"], name: "index_finished_questions_on_question_id", using: :btree
  add_index "finished_questions", ["user_id"], name: "index_finished_questions_on_user_id", using: :btree

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

  add_index "question_ratings", ["question_id"], name: "index_question_ratings_on_question_id", using: :btree
  add_index "question_ratings", ["user_id"], name: "index_question_ratings_on_user_id", using: :btree

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
    t.integer  "answers_count",    default: 0
    t.float    "overall",          default: 3.0
    t.float    "difficulty",       default: 3.0
    t.float    "uniqueness",       default: 3.0
  end

  add_index "questions", ["professor_id"], name: "index_questions_on_professor_id", using: :btree
  add_index "questions", ["source_id"], name: "index_questions_on_source_id", using: :btree
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id", using: :btree

  create_table "questiontags", force: true do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questiontags", ["question_id"], name: "index_questiontags_on_question_id", using: :btree
  add_index "questiontags", ["tag_id"], name: "index_questiontags_on_tag_id", using: :btree

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

  add_index "sittings", ["question_id"], name: "index_sittings_on_question_id", using: :btree
  add_index "sittings", ["term_id"], name: "index_sittings_on_term_id", using: :btree

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
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
