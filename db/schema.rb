ActiveRecord::Schema.define(version: 2021_05_31_054736) do
  enable_extension "plpgsql"

  create_table "todos", force: :cascade do |t|
    t.text "todo_text"
    t.date "due_date"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
