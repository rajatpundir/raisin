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

ActiveRecord::Schema.define(version: 20170502133659) do

  create_table "answers", force: :cascade do |t|
    t.integer  "subjective_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subjective_id"], name: "index_answers_on_subjective_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer  "objective_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["objective_id"], name: "index_choices_on_objective_id"
  end

  create_table "configurations", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_configurations_on_question_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string   "floorname",  null: false
    t.integer  "tower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tower_id"], name: "index_floors_on_tower_id"
  end

  create_table "global_posts", force: :cascade do |t|
    t.string   "message",         null: false
    t.string   "origin"
    t.integer  "global_topic_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["global_topic_id"], name: "index_global_posts_on_global_topic_id"
  end

  create_table "global_topics", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "message"
    t.string   "origin"
    t.integer  "tower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tower_id"], name: "index_global_topics_on_tower_id"
  end

  create_table "moderator_posts", force: :cascade do |t|
    t.string   "message",            null: false
    t.string   "origin"
    t.integer  "moderator_topic_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["moderator_topic_id"], name: "index_moderator_posts_on_moderator_topic_id"
  end

  create_table "moderator_topics", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "message"
    t.string   "origin"
    t.integer  "tower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tower_id"], name: "index_moderator_topics_on_tower_id"
  end

  create_table "moderators", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "tower_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tower_id"], name: "index_moderators_on_tower_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "message"
    t.string   "origin"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_notifications_on_floor_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_objectives_on_question_id"
  end

  create_table "options", force: :cascade do |t|
    t.string   "message"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_options_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "message"
    t.string   "origin"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_polls_on_floor_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "message",    null: false
    t.string   "origin"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_posts_on_topic_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "regulars", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "floor_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["floor_id"], name: "index_regulars_on_floor_id"
  end

  create_table "subjectives", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_subjectives_on_question_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.text     "message"
    t.string   "origin"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_tags_on_floor_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "origin"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_tests_on_floor_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "message"
    t.string   "origin"
    t.integer  "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_topics_on_floor_id"
  end

  create_table "towers", force: :cascade do |t|
    t.string   "towername",       null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "voters", force: :cascade do |t|
    t.string   "username",   null: false
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_voters_on_option_id"
  end

end
