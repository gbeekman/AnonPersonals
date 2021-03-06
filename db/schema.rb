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

ActiveRecord::Schema.define(version: 20160602180859) do

  create_table "chats", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "chats", ["conversation_id"], name: "index_chats_on_conversation_id"
  add_index "chats", ["user_id"], name: "index_chats_on_user_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "messages", force: :cascade do |t|
    t.string   "body",         null: false
    t.integer  "sender_id",    null: false
    t.integer  "receiver_id",  null: false
    t.integer  "personals_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "personals", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.string   "location"
    t.string   "gender",     null: false
    t.string   "age",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "personals", ["user_id"], name: "index_personals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "username",                        null: false
    t.string   "session_token",                   null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.text     "partners"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
