class MakeDummyUsers < ActiveRecord::Migration
  def self.up
  	down
  	
    # Admin user ... you're always going to want this one!
    User.create( # 1
        :login => 'admin',
        :password => 'admin',
        :password_confirmation => 'admin',
        :title => '',
        :email => 'EEE.Webmaster@Swansea.ac.uk',
        :first_name => 'Proman',
        :last_name => 'Administrator',
        :staff_or_student_number => '099999')
        
    # A dummy student
    User.create( # 2
        :login => '000000',
        :password => 'student',
        :password_confirmation => 'student',
        :email => '000000@Swansea.ac.uk',
        :title => 'Mr',
        :first_name => 'John',
        :last_name => 'Doe',
        :staff_or_student_number => '000000')
        
    # A dummy staff member
    User.create( # 3
        :login => 'A.N.Academic',
        :password => 'staff',
        :password_confirmation => 'staff',
        :email => 'A.N.Academic@Swansea.ac.uk',
        :title => 'Prof.',
        :first_name => 'Anne',
        :last_name => 'Academic',
        :staff_or_student_number => '099998')
    
    # A dummy coordinator
    User.create( # 4
        :login => 'A.Coordinator',
        :password => 'coordinator',
        :password_confirmation => 'coordinator',
        :email => 'A.Coordinator@Swansea.ac.uk',
        :title => 'Dr.',
        :first_name => 'Anthony',
        :last_name => 'Coordinator',
        :staff_or_student_number => '099997')
    
    # A real staff member (Dr Jobling is Module Coordinator)!
    User.create( # 5
        :login => 'C.P.Jobling',
        :password => '07/05/1959',
        :password_confirmation => '07/05/1959',
        :email => 'C.P.Jobling@swansea.ac.uk',
        :title=> 'Dr',
        :first_name => 'Chris',
        :last_name => 'Jobling',
        :staff_or_student_number => '039934')
  end

  def self.down
   	User.delete_all 
  end
end