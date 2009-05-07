require "migration_helpers"
class CreateTableStudents < ActiveRecord::Migration
extend MigrationHelpers
  def self.up
    create_table "students" do |t|
      t.column :user_id,                    :integer
      t.column :grade,                      :integer, :limit => 3
      t.column :first_name,                 :string
      t.column :last_name,                  :string
      t.column :project_id,                 :integer
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
