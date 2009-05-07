class MakeDummyUsers < ActiveRecord::Migration
  def self.up
    # Admin user ... you're always goind to want this one!
    User.create(
        :login => 'admin',
        :password => 'admin',
        :password_confirmation => 'admin',
        :title => '',
        :email => 'EEE.Webmaster@Swansea.ac.uk',
        :first_name => 'Proman',
        :last_name => 'Administrator')
        
    # A dummy student
    User.create(
        :login => 'student',
        :password => 'student',
        :password_confirmation => 'student',
        :email => '000000@Swansea.ac.uk',
        :title => 'Mr',
        :first_name => 'John',
        :last_name => 'Doe')
        
    # A real staff member!
    User.create(
        :login => 'C.P.Jobling',
        :password => '07/05/1959',
        :password_confirmation => '07/05/1959',
        :email => 'C.P.Jobling@swansea.ac.uk',
        :title=> 'Dr',
        :first_name => 'Chris',
        :last_name => 'Jobling')
    end

  def self.down
    
  end
end