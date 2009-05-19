class AddStaffOrStudentFieldToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :staff_or_student, :string, :default => "student"
  end

  def self.down
  	removed_column :users, :staff_or_student
  end
end
