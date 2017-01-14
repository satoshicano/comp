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

ActiveRecord::Schema.define(version: 20170114131404) do

  create_table "dishes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "number",     limit: 24
    t.float    "gram",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "food_id"
    t.integer  "recipe_id"
    t.index ["food_id"], name: "fk_rails_0c50f858e8", using: :btree
    t.index ["recipe_id"], name: "fk_rails_abcc6c92c3", using: :btree
  end

  create_table "food_step_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "food_step_id"
    t.integer  "recipe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["food_step_id"], name: "fk_rails_461a73235a", using: :btree
    t.index ["recipe_id"], name: "fk_rails_cc9d162585", using: :btree
  end

  create_table "food_steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "step_id"
    t.integer  "food_id"
    t.index ["food_id"], name: "fk_rails_618cded0ef", using: :btree
    t.index ["step_id"], name: "fk_rails_990a26558b", using: :btree
  end

  create_table "foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "calorie",     limit: 24
    t.float    "ash",         limit: 24
    t.float    "cholesterol", limit: 24
    t.float    "protein",     limit: 24
    t.float    "water",       limit: 24
    t.float    "fiber",       limit: 24
    t.float    "fat",         limit: 24
    t.float    "carb",        limit: 24
    t.integer  "step_id"
    t.string   "option"
    t.boolean  "leather"
    t.integer  "cost"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "menus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "servings"
    t.integer  "dish_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "fk_rails_9c43157b6c", using: :btree
    t.index ["menu_id"], name: "fk_rails_52f5da1b31", using: :btree
  end

  create_table "steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "time",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "food_recipes", "foods"
  add_foreign_key "food_recipes", "recipes"
  add_foreign_key "food_step_recipes", "food_steps"
  add_foreign_key "food_step_recipes", "recipes"
  add_foreign_key "food_steps", "foods"
  add_foreign_key "food_steps", "steps"
  add_foreign_key "recipes", "dishes"
  add_foreign_key "recipes", "menus"
end
