# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 17) do

  create_table "disciplines", :force => true do |t|
    t.string "name"
  end

  create_table "disciplines_projects", :id => false, :force => true do |t|
    t.integer "discipline_id"
    t.integer "project_id"
  end

  add_index "disciplines_projects", ["discipline_id"], :name => "index_disciplines_projects_on_discipline_id"
  add_index "disciplines_projects", ["project_id"], :name => "index_disciplines_projects_on_project_id"

  create_table "projects", :force => true do |t|
    t.integer  "createdby"
    t.text     "title"
    t.text     "description"
    t.text     "resources"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "students", :force => true do |t|
    t.integer "user_id"
    t.integer "grade",      :limit => 3
    t.integer "project_id"
    t.integer "tour",                    :default => 1
  end

  add_index "students", ["user_id"], :name => "fk_students_user_id"
  add_index "students", ["project_id"], :name => "fk_students_project_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "wishes", :id => false, :force => true do |t|
    t.integer "student_id"
    t.integer "project_id"
    t.integer "wish"
    t.integer "tour",       :default => 1
  end

  add_index "wishes", ["student_id"], :name => "fk_wishes_student_id"
  add_index "wishes", ["project_id"], :name => "fk_wishes_project_id"

end
