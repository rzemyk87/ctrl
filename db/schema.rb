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

ActiveRecord::Schema.define(version: 2019_07_03_204800) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cache_items", force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.text "meta_info"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["expires_at"], name: "index_cache_items_on_expires_at"
    t.index ["key"], name: "index_cache_items_on_key", unique: true
    t.index ["updated_at"], name: "index_cache_items_on_updated_at"
  end

  create_table "firmas", force: :cascade do |t|
    t.integer "firma_id"
    t.string "log_in", limit: 20
    t.string "Nazwa", limit: 100
    t.string "NIP", limit: 16, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_wygasniecia"
    t.boolean "aktywna"
    t.string "adres"
    t.string "poczta"
    t.string "miasto"
    t.string "tekst"
  end

  create_table "osobas", force: :cascade do |t|
    t.string "osoba_imie"
    t.string "osoba_nazwisko"
    t.string "osoba_data"
    t.string "osoba_miejsce"
    t.string "osoba_ocena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "szkolenie_id"
    t.integer "nr_zaswiadczenia"
    t.integer "rodzaj_id"
    t.string "stanowisko"
    t.boolean "confirm", default: false
  end

  create_table "rodzaj_szkolenia", force: :cascade do |t|
    t.string "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rodzajs", force: :cascade do |t|
    t.string "rodzaj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "szkolenies", force: :cascade do |t|
    t.integer "szkolenie_id"
    t.string "prowadzacy"
    t.string "firma"
    t.date "data_od"
    t.date "data_do"
    t.string "forma"
    t.string "data_wystawienia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rodzaj_id"
    t.date "data_waznosci"
    t.integer "firma_id"
    t.index ["firma_id"], name: "index_szkolenies_on_firma_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "uzytkowniks", force: :cascade do |t|
    t.string "imie", limit: 20
    t.string "nazwisko", limit: 60
    t.string "uzytkownik", limit: 25
    t.string "email", limit: 100, default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "firma_id"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.integer "uprawnienia"
    t.string "reset_password_token"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["firma_id"], name: "index_uzytkowniks_on_firma_id"
  end

end
