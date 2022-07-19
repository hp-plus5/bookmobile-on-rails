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

ActiveRecord::Schema[7.0].define(version: 2022_07_15_173157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.boolean "is_queer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.float "rating"
    t.string "language"
    t.binary "cover_image"
    t.string "genre"
    t.boolean "is_fiction"
    t.float "dewey_decimal"
    t.integer "publication_year"
    t.boolean "female_protagonist?"
    t.boolean "queer_protagonist?"
    t.boolean "queer_character?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_authors", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "user_id", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_personal_authors_on_author_id"
    t.index ["user_id"], name: "index_personal_authors_on_user_id"
  end

  create_table "personal_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.string "tags"
    t.integer "reading_status", default: 0
    t.boolean "is_owned?", default: true
    t.boolean "was_recommended?", default: false
    t.string "recommended_by"
    t.float "rating"
    t.date "completion_date"
    t.text "relevant_links"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_personal_books_on_book_id"
    t.index ["user_id"], name: "index_personal_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "personal_authors", "authors"
  add_foreign_key "personal_authors", "users"
  add_foreign_key "personal_books", "books"
  add_foreign_key "personal_books", "users"
end
