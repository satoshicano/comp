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

ActiveRecord::Schema.define(version: 20170114141242) do

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
    t.index ["food_id"], name: "index_food_recipes_on_food_id", using: :btree
    t.index ["recipe_id"], name: "index_food_recipes_on_recipe_id", using: :btree
  end

  create_table "food_step_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "recipi_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "food_steps_id"
    t.integer  "recipes_id"
    t.index ["food_steps_id"], name: "index_food_step_recipes_on_food_steps_id", using: :btree
    t.index ["recipes_id"], name: "index_food_step_recipes_on_recipes_id", using: :btree
  end

  create_table "food_steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "steps_id"
    t.integer  "foods_id"
    t.index ["foods_id"], name: "index_food_steps_on_foods_id", using: :btree
    t.index ["steps_id"], name: "index_food_steps_on_steps_id", using: :btree
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menus_id"
    t.integer  "dishes_id"
    t.index ["dishes_id"], name: "index_recipes_on_dishes_id", using: :btree
    t.index ["menus_id"], name: "index_recipes_on_menus_id", using: :btree
  end

  create_table "steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "time",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
