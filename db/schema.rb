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

ActiveRecord::Schema.define(version: 20190320203917) do

  create_table "firmas", force: :cascade do |t|
    t.integer "firma_id"
    t.string "log_in", limit: 20
    t.string "Nazwa", limit: 100
    t.string "NIP", limit: 16, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "uzytkowniks", force: :cascade do |t|
    t.string "imie", limit: 20
    t.string "nazwisko", limit: 60
    t.string "uzytkownik", limit: 25
    t.string "email", limit: 100, default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "firma_id"
    t.index ["firma_id"], name: "index_uzytkowniks_on_firma_id"
  end

end
