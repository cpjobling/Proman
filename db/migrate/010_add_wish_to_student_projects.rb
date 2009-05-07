class AddWishToStudentProjects < ActiveRecord::Migration
  def self.up
    add_column :wishes, :wish, :int
  end

  def self.down
    remove_column :wishes, :wish
  end
end
