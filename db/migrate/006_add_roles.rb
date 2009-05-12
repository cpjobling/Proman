class AddRoles < ActiveRecord::Migration
  def self.up
  	down

    # Create roles from fixture ... see dev_data/README.txt
    directory = File.join(File.dirname(__FILE__), '../../test/fixtures')
    Fixtures.create_fixtures(directory, "roles")
  end

  def self.down
  	Role.delete_all
  end
end
