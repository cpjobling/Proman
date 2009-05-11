class AddSomeData < ActiveRecord::Migration
  def self.up
    
    # Create projects from fixture ... see dev_data/README.txt
    directory = File.join(File.dirname(__FILE__), '../../test/fixtures')
    Fixtures.create_fixtures(directory, "projects")
    

    
    #********************************************************************
    # Creates a user gives him a student role and then turns him into a  
    # student and selects his wishes
    student1 = User.create(
        :login => '111112',
        :first_name => 'kirouuuu',            
        :last_name => 'spirov', 
        :password => 'student1',
        :password_confirmation => 'student1',
        :email => '111113@swan.ac.uk',
        :title => 'Mr',
        :staff_or_student_number => '111112')

    
    student_role = Role.find_by_name('student')
    student.roles << student_role
    student.save
    
    Student.create(
        :user_id => student1.id,                  
        :grade => '100.00',                                  
        :project_id => '')
            
    Wish.create(
        :student_id => student.id,
        :project_id => '1',
        :wish => '1')
                      
    Wish.create(
        :student_id => student.id,
        :project_id => '2',
        :wish => '2')
                      
    Wish.create(
        :student_id => student.id,
        :project_id => '3',
        :wish => '3')
                                
# Another student

    student2 =  User.create(
        :login => '111113',
        :first_name => 'mirouuuu',            
        :last_name => 'sadsfj',
        :password => 'student2',
        :password_confirmation => 'student2',
        :email => '111113@swan.ac.uk',
        :title => 'Miss',
        :staff_or_student_number => '111113')

    student2.roles << student_role
    student.save
    
    Student.create(
        :user_id => student2.id,                  
        :grade => '90.0',
        :project_id = '')                  
              
    Wish.create(
       :student_id => '2',
       :project_id => '1',
       :wish => '1')
   Wish.create(
       :student_id => '2',
       :project_id => '2',
       :wish => '2')
                
   Wish.create(
      :student_id => '2',
      :project_id => '3',
      :wish => '3')

# And another    
    student3 = User.create(
        :login => '111114',
        :first_name => 'ivan',            
        :last_name => 'spdfgdfgdhg', 
        :password => 'student3',
        :password_confirmation => 'student3',
        :email => '111114@swan.ac.uk',
        :title => 'Ms',
        :staff_or_student_number => '111114')

    student3.roles << student_role
    student3.save
    
    Student.create(
        :user_id => '6',                  
        :grade => '80.0',                                
        :project_id => '')
              
    Wish.create(
         :student_id => '3',
         :project_id => '1',
         :wish => '1')
                      
    Wish.create(
         :student_id => '3',
         :project_id => '2',
         :wish => '2')
                      
   Wish.create(
        :student_id => '3',
        :project_id => '3',
        :wish => '3')

  end

  def self.down
    
  end
end
