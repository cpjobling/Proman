class MakeUsers < ActiveRecord::Migration
  def self.up
    # Admin user
    User.create(
        :login => 'admin',
        :password => 'admin',
        :password_confirmation => 'admin',
        :email => 'admin@xyz.com',
        :first_name => 'nick',
        :last_name => 'hass')
    User.create(
        :login => 'student',
        :password => 'student',
        :password_confirmation => 'student',
        :email => 'student@xyz.com',
        :first_name => 'hollooo',
        :last_name => 'prrrrr')
    User.create(
        :login => 'staff',
        :password => 'staff',
        :password_confirmation => 'staff',
        :email => 'staff@xyz.com',
        :first_name => 'chris',
        :last_name => 'jobling')
  end

  def self.down
    
  end
end