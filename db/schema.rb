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

ActiveRecord::Schema.define(version: 20131127165104) do

  create_table "professors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "subject_id"
    t.integer  "term_id"
    t.integer  "source_id"
    t.integer  "professor_id"
    t.integer  "year"
    t.string   "number"
    t.integer  "mini"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["professor_id"], name: "index_questions_on_professor_id"
  add_index "questions", ["source_id"], name: "index_questions_on_source_id"
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"
  add_index "questions", ["term_id"], name: "index_questions_on_term_id"

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

end
