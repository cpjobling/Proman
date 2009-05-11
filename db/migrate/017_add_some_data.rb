class AddSomeData < ActiveRecord::Migration
  def self.up
    
    # Create projects from fixture ... see dev_data/README.txt
    directory = File.join(File.dirname(__FILE__), '../../test/fixtures')
    Fixtures.create_fixtures(directory, "projects")
    

    
    #********************************************************************
    # Creates a user gives him a student role and then turns him into a  
    # student and selects his wishes
    user = User.create(
        :login => '111112',
        :first_name => 'kirouuuu',            
        :last_name => 'spirov', 
        :password => 'student1',
        :password_confirmation => 'student1',
        :email => '111112@swan.ac.uk',
        :title => 'Mr',
        :staff_or_student_number => '111112')

    puts "Created: used.id = #{user.id}: #{ user.to_s}" 
    student_role = Role.find_by_name('student')
    user.roles << student_role
    user.save
    
    student1 = Student.create(
        :user_id => user.id,                  
        :grade => '100.00',                                  
        :project_id => '')
            
    Wish.create(
        :student_id => student1.id,
        :project_id => '1',
        :wish => '1')
                      
    Wish.create(
        :student_id => student1.id,
        :project_id => '2',
        :wish => '2')
                      
    Wish.create(
        :student_id => student1.id,
        :project_id => '3',
        :wish => '3')
                                
# Another student

    user =  User.create(
        :login => '111113',
        :first_name => 'mirouuuu',            
        :last_name => 'sadsfj',
        :password => 'student2',
        :password_confirmation => 'student2',
        :email => '111113@swan.ac.uk',
        :title => 'Miss',
        :staff_or_student_number => '111113')

    puts "Created: used.id = #{user.id}: #{ user.to_s}" 
    user.roles << student_role
    user.save
    
    student2 = Student.create(
        :user_id => user.id,                  
        :grade => '90.0',
        :project_id => '')                  
              
    Wish.create(
      :student_id => student2.id,
      :project_id => '1',
      :wish => '1')

    Wish.create(
      :student_id => student2.id,
      :project_id => '2',
      :wish => '2')
                
   Wish.create(
      :student_id => student2.id,
      :project_id => '3',
      :wish => '3')

# And another    
    user = User.create(
        :login => '111114',
        :first_name => 'ivan',            
        :last_name => 'spdfgdfgdhg', 
        :password => 'student3',
        :password_confirmation => 'student3',
        :email => '111114@swan.ac.uk',
        :title => 'Ms',
        :staff_or_student_number => '111114')

    puts "Created: used.id = #{user.id}: #{ user.to_s}" 
    user.roles << student_role
    user.save
    
    student3 = Student.create(
        :user_id => user.id,                  
        :grade => '80.0',                                
        :project_id => '')
              
    Wish.create(
         :student_id => student3.id,
         :project_id => '1',
         :wish => '1')
                      
    Wish.create(
         :student_id => student3.id,
         :project_id => '2',
         :wish => '2')
                      
   Wish.create(
        :student_id => student3.id,
        :project_id => '3',
        :wish => '3')

  end

  def self.down
    Wish.delete_all
    Student.delete_all
  end
end
