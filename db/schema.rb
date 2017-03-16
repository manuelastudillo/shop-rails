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

ActiveRecord::Schema.define(version: 20170316152312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "rut"
    t.integer  "fono"
    t.integer  "email"
    t.integer  "comuna_id"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comuna_id"], name: "index_clientes_on_comuna_id", using: :btree
  end

  create_table "comunas", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "provincias_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["provincias_id"], name: "index_comunas_on_provincias_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "brand_id"
    t.integer  "unit_id"
    t.integer  "category_id"
    t.integer  "stock"
    t.integer  "min_stock"
    t.integer  "price"
    t.integer  "proveedor_id"
    t.string   "slug"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["proveedor_id"], name: "index_items_on_proveedor_id", using: :btree
    t.index ["unit_id"], name: "index_items_on_unit_id", using: :btree
  end

  create_table "proveedors", force: :cascade do |t|
    t.string   "name"
    t.string   "rut"
    t.integer  "fono"
    t.integer  "email"
    t.integer  "comuna_id"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comuna_id"], name: "index_proveedors_on_comuna_id", using: :btree
  end

  create_table "provincias", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "regiones_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["regiones_id"], name: "index_provincias_on_regiones_id", using: :btree
  end

  create_table "regiones", force: :cascade do |t|
    t.string   "nombre"
    t.string   "corfo"
    t.string   "codigo"
    t.integer  "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "number"
    t.integer  "item_id"
    t.integer  "qty"
    t.integer  "price"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "number"
    t.date     "date"
    t.integer  "state"
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_sales_on_cliente_id", using: :btree
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "nombre"
    t.string   "calle"
    t.integer  "telefono"
    t.integer  "telefono1"
    t.integer  "rol_id"
    t.integer  "comuna_id"
    t.datetime "fechaingreso"
    t.integer  "sueldo"
    t.string   "rut"
    t.string   "slug"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "apellido"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

  add_foreign_key "clientes", "comunas"
  add_foreign_key "comunas", "provincias", column: "provincias_id"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "proveedors"
  add_foreign_key "items", "units"
  add_foreign_key "proveedors", "comunas"
  add_foreign_key "provincias", "regiones", column: "regiones_id"
  add_foreign_key "sales", "clientes"
end
