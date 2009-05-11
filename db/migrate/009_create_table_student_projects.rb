require "migration_helpers"
class CreateTableStudentProjects < ActiveRecord::Migration
  extend MigrationHelpers
  def self.up
    create_table "wishes", :id => false do |t|
      t.column :student_id,                    :integer
      t.column :project_id,                    :integer
    end
   add_foreign_key("wishes", "student_id", "students")
   add_foreign_key("wishes", "project_id", "projects")
  end

  def self.down
    drop_table "wishes"
  end
end
