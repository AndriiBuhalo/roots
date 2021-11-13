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

ActiveRecord::Schema.define(version: 2021_11_13_131548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attachment_relations", force: :cascade do |t|
    t.bigint "attachment_id"
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.index ["attachable_type", "attachable_id"], name: "index_attachment_relations_on_attachable"
    t.index ["attachment_id"], name: "index_attachment_relations_on_attachment_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "image_infos", force: :cascade do |t|
    t.string "keywords"
    t.string "notes"
    t.string "place"
    t.string "date_accuracy"
    t.datetime "image_date"
    t.string "downloaded"
    t.bigint "attachment_id"
    t.index ["attachment_id"], name: "index_image_infos_on_attachment_id"
  end

end
