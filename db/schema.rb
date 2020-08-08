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

ActiveRecord::Schema.define(version: 2020_08_07_072803) do

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "author_id"
    t.integer "receiver_id"
    t.index ["author_id"], name: "index_conversations_on_author_id", unique: true
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id", unique: true
  end

  create_table "conversations_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_conversations_users_on_conversation_id"
    t.index ["user_id"], name: "index_conversations_users_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.integer "conversation_id"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_messages_on_author_id", unique: true
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", unique: true
    t.index ["receiver_id"], name: "index_messages_on_receiver_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "chat_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_conversations", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_users_conversations_on_conversation_id"
    t.index ["user_id"], name: "index_users_conversations_on_user_id"
  end

  add_foreign_key "messages", "conversations"
end
