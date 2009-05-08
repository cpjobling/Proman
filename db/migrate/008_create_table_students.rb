require "migration_helpers"
class CreateTableStudents < ActiveRecord::Migration
extend MigrationHelpers
  def self.up
    create_table "students" do |t|
      t.integer :user_id
      t.decimal :grade
      t.integer :project_id
    end
   add_foreign_key("students", "user_id", "users")
   add_foreign_key("students", "project_id", "projects")
  end

  def self.down
    remove_foreign_key("students", "user_id")
    remove_foreign_key("students", "project_id")
    drop_table "students"
  end
end
