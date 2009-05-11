require "migration_helpers"
class CreateUsersAndProjects < ActiveRecord::Migration
extend MigrationHelpers
  def self.up
  	down
    create_table "users", :force => true do |t|
      t.string :login
      t.string :title, :limit => 10
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.string :staff_or_student_number, :limit => 10 
      
      t.timestamps   
    end
    
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :resources

      t.timestamps
    end
    
    add_foreign_key("projects", "user_id", "users")

  end

  def self.down
    drop_table :projects
    drop_table :users
  end
end
