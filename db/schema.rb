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

  create_table "artykuls", force: :cascade do |t|
    t.integer "strona_id"
    t.string "nazwa"
    t.integer "pozycja"
    t.boolean "widoczny", default: true
    t.text "zawartosc"
    t.string "zdjecie_file_name"
    t.string "zdjecie_content_type"
    t.integer "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biurowes", force: :cascade do |t|
    t.integer "kurs_id"
    t.integer "szkolenie_id"
    t.string "prowadzacy"
    t.string "firma"
    t.date "data_od"
    t.date "data_do"
    t.string "rodzaj_szkolenia"
    t.string "data_wystawienia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "firmas", force: :cascade do |t|
    t.integer "firma_id"
    t.string "log_in", limit: 20
    t.string "Nazwa", limit: 100
    t.string "NIP", limit: 16, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galeries", force: :cascade do |t|
    t.string "nazwa"
    t.integer "pozycja"
    t.text "opis"
    t.boolean "widoczna", default: false
    t.string "zdjecie_file_name"
    t.string "zdjecie_content_type"
    t.integer "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inzynieries", force: :cascade do |t|
    t.string "inz_imie"
    t.string "inz_nazwisko"
    t.string "inz_data"
    t.string "inz_miejsce"
    t.string "inz_ocena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inzynierzy_id"
    t.index ["inzynierzy_id"], name: "index_inzynieries_on_inzynierzy_id"
  end

  create_table "inzynierzies", force: :cascade do |t|
    t.integer "kurs_id"
    t.integer "szkolenie_id"
    t.string "prowadzacy"
    t.string "firma"
    t.date "data_od"
    t.date "data_do"
    t.string "rodzaj_szkolenia"
    t.integer "osoba_id"
    t.string "data_wystawienia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kategories", force: :cascade do |t|
    t.string "nazwa"
    t.integer "pozycja"
    t.boolean "widoczna", default: true
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

  create_table "pracodawcies", force: :cascade do |t|
    t.string "prac_imie"
    t.string "prac_nazwisko"
    t.string "prac_data"
    t.string "prac_miejsce"
    t.string "prac_ocena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pracodawcow_id"
    t.index ["pracodawcow_id"], name: "index_pracodawcies_on_pracodawcow_id"
  end

  create_table "pracodawcows", force: :cascade do |t|
    t.integer "kurs_id"
    t.integer "szkolenie_id"
    t.string "prowadzacy"
    t.string "firma"
    t.date "data_od"
    t.date "data_do"
    t.string "rodzaj_szkolenia"
    t.string "data_wystawienia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prowadzacies", force: :cascade do |t|
    t.string "imie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "robotnicies", force: :cascade do |t|
    t.string "robo_imie"
    t.string "robo_nazwisko"
    t.string "robo_data"
    t.string "robo_miejsce"
    t.string "robo_ocena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "robotnicze_id"
  end

  create_table "robotniczes", force: :cascade do |t|
    t.integer "kurs_id"
    t.integer "szkolenie_id"
    t.string "prowadzacy"
    t.string "firma"
    t.date "data_od"
    t.date "data_do"
    t.string "rodzaj_szkolenia"
    t.string "data_wystawienia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "stronas", force: :cascade do |t|
    t.integer "kategorie_id"
    t.string "nazwa"
    t.integer "pozycja"
    t.boolean "widoczna", default: true
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

  create_table "zdjecies", force: :cascade do |t|
    t.integer "galerie_id"
    t.string "nazwa"
    t.integer "pozycja"
    t.boolean "widoczne", default: true
    t.string "opis"
    t.string "zdjecie_file_name"
    t.string "zdjecie_content_type"
    t.integer "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
