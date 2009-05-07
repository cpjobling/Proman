class AddTourToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :tour, :int, :default => 1
  end

  def self.down
    remove_column :students, :tour
  end
end
