require 'active_record/fixtures'

class MakeDummyUsers < ActiveRecord::Migration
  def self.up
  	down
  	
    # Create uses from fixture ... see dev_data/README.txt
    directory = File.join(File.dirname(__FILE__), 'dev_data')
    Fixtures.create_fixtures(directory, "users")
  end

  def self.down
   	User.delete_all 
  end
end