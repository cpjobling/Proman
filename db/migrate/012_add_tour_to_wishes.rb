class AddTourToWishes < ActiveRecord::Migration
  def self.up
    add_column :wishes, :tour, :int, :default => 1
  end

  def self.down
    remove_column :wishes, :tour
  end
end
