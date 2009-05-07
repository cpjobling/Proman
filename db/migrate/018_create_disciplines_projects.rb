class CreateDisciplinesProjects < ActiveRecord::Migration
  def self.up
    create_table :disciplines_projects do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines_projects
  end
end
