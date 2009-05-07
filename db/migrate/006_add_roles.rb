class AddRoles < ActiveRecord::Migration
  def self.up
    r1 = Role.create :name=>"admin";
    r2 = Role.create :name=>"staff";
    r3 = Role.create :name=>"student";
    r1.save();
    r2.save();
    r3.save();
  end

  def self.down
  end
end
