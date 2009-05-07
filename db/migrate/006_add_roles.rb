class AddRoles < ActiveRecord::Migration
  def self.up
  	down
    role = Role.create :name=>"admin"; role.save()
    role = Role.create :name=>"staff"; role.save()
    role = Role.create :name=>"student"; role.save()
    role = Role.create :name=>"coordinator"; role.save()
  end

  def self.down
  	Role.delete_all
  end
end
