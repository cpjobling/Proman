class CreateUsers < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
    drop_table "users"
  end
end
