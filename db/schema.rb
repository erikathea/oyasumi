ActiveRecord::Schema[7.0].define(version: 2023_03_18_131026) do
  create_table "follows", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "followed_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "followed_user_id"], name: "index_follows_on_user_id_and_followed_user_id", unique: true
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "clock_in"
    t.datetime "clock_out"
    t.string "remarks"
    t.string "time_zone", default: "UTC"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "remarks"], name: "index_records_on_user_id_and_remarks"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.string "time_zone", default: "UTC"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "follows", "users"
  add_foreign_key "follows", "users", column: "followed_user_id"
  add_foreign_key "records", "users"
end
