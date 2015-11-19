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

ActiveRecord::Schema.define(version: 20151119023623) do

  create_table "appointments", force: :cascade do |t|
    t.string   "motivo"
    t.datetime "fecha"
    t.text     "anotaciones"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "patient_id"
  end

  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id"

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "nombre"
    t.string   "aPaterno"
    t.string   "aMaterno"
    t.date     "fechaNac"
    t.boolean  "sexo"
    t.string   "domicilioCalle"
    t.string   "domicilioCiudad"
    t.string   "telefono"
    t.boolean  "bajoTMedico"
    t.boolean  "tomaActualMedicamento"
    t.string   "medicamentoTomado"
    t.boolean  "sangraExcesivo"
    t.boolean  "esVIH"
    t.boolean  "estaEmbarazada"
    t.boolean  "esAlergico"
    t.string   "medicamentoAlergia"
    t.string   "tipoSangre"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id"

  create_table "procedures", force: :cascade do |t|
    t.integer  "appointment_id"
    t.string   "nombre"
    t.string   "tipo"
    t.text     "descripcion"
    t.decimal  "precio"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "procedures", ["appointment_id"], name: "index_procedures_on_appointment_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
