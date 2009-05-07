class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :createdby
      t.text :title
      t.text :description
      t.text :resources

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
