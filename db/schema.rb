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

ActiveRecord::Schema.define(version: 20150426182740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividads", force: :cascade do |t|
    t.string  "codac",       limit: 4,  null: false
    t.string  "nombre",      limit: 20, null: false
    t.string  "descripcion", limit: 50
    t.integer "ponderacion",            null: false
    t.string  "codpr",       limit: 4,  null: false
    t.integer "id_parcial"
  end

  create_table "alumnos", force: :cascade do |t|
    t.string  "matricula",     limit: 9,                    null: false
    t.string  "nombre",        limit: 25,                   null: false
    t.string  "apellido_p",    limit: 20,                   null: false
    t.string  "apellido_m",    limit: 20,                   null: false
    t.integer "edad",                                       null: false
    t.date    "fecha_ingreso",                              null: false
    t.string  "password",      limit: 15, default: "12345", null: false
    t.string  "codca",         limit: 4,                    null: false
    t.integer "id_carrera"
  end

  create_table "carreras", force: :cascade do |t|
    t.string  "codca",       limit: 4,  null: false
    t.string  "nombre",      limit: 30, null: false
    t.string  "siglas",      limit: 4
    t.string  "coddr",       limit: 4,  null: false
    t.integer "id_director"
  end

  create_table "cursos", force: :cascade do |t|
    t.string  "codma",           limit: 4,  null: false
    t.string  "nombre",          limit: 50, null: false
    t.integer "horas_semanales"
    t.string  "requerimiento",   limit: 4
  end

  create_table "directors", force: :cascade do |t|
    t.string "coddr",    limit: 4,                    null: false
    t.string "nombre",   limit: 25
    t.string "password", limit: 15, default: "12345", null: false
  end

  create_table "materia_alumnos", force: :cascade do |t|
    t.integer  "materia_id"
    t.integer  "alumno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha"
  end

  add_index "materia_alumnos", ["alumno_id"], name: "index_materia_alumnos_on_alumno_id", using: :btree
  add_index "materia_alumnos", ["materia_id"], name: "index_materia_alumnos_on_materia_id", using: :btree

  create_table "materia_carreras", force: :cascade do |t|
    t.integer  "materia_id"
    t.integer  "carrera_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semestre"
  end

  add_index "materia_carreras", ["carrera_id"], name: "index_materia_carreras_on_carrera_id", using: :btree
  add_index "materia_carreras", ["materia_id"], name: "index_materia_carreras_on_materia_id", using: :btree

  create_table "materia_profesors", force: :cascade do |t|
    t.integer  "materia_id"
    t.integer  "profesor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materia_profesors", ["materia_id"], name: "index_materia_profesors_on_materia_id", using: :btree
  add_index "materia_profesors", ["profesor_id"], name: "index_materia_profesors_on_profesor_id", using: :btree

  create_table "parcials", force: :cascade do |t|
    t.string  "codpr",             limit: 4, null: false
    t.integer "numero",                      null: false
    t.integer "calificacion"
    t.string  "matricula",         limit: 9, null: false
    t.string  "codma",             limit: 4, null: false
    t.integer "id_materia_alumno"
  end

  create_table "profesors", force: :cascade do |t|
    t.string "nomina",   limit: 9,                    null: false
    t.string "nombre",   limit: 25,                   null: false
    t.string "apellido", limit: 20,                   null: false
    t.string "password", limit: 15, default: "12345", null: false
  end

end
