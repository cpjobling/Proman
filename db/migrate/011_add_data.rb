class AddData < ActiveRecord::Migration
  def self.up
    
    #Creates projects
    Project.create(
        :createdby => '3',
        :title => 'Project 1',
        :description => 'It is the shit bla bla bla bla blat is tha bt is the shit bla bt is the shit bla bt is the shit ble shit bla bla bla bla blat is the shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
      
        Project.create(
        :createdby => '3',
        :title => 'Project 2',
        :description => 'It is the shit bla bla bla bla blat is ta bt is the shit bla bt is the shit bla bt is the shit bla bt is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
      
        Project.create(
        :createdby => '3',
        :title => 'Project 3',
        :description => 'It is the shit bla bla bt is ta bt is the shit bla bt is the shit bla bt is the shit bla bt is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla blala bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '14',
        :title => 'Project 4',
        :description => 'It is the the shit bla bt is the shit bla bt is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '14',
        :title => 'Project 5',
        :description => 'It is the shit bla bla bla bla blat is ta bt iss the shit bla bt is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '14',
        :title => 'Project 6',
        :description => 'It is the shit bla bla bla blt blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '15',
        :title => 'Project 7',
        :description => 'It is the shit bla bla bla blahe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '15',
        :title => 'Project 8',
        :description => 'It is the shit bla bla bla bla blat is ta bt is the shthe shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '15',
        :title => 'Project 9',
        :description => 'It is the shit bla bla bla bla blat is tat is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
            
        Project.create(
        :createdby => '15',
        :title => 'Project 10',
        :description => 'It is the shit bla bla bla bla blat is ta bbla bt is the shit blhe shit bla bla bla bla blat is the shit bla bla bla bla bla',
        :resources => 'none')
      
    
    
    #********************************************************************
    #Creates a user gives him a student role and then turns him into a student and selects his wishes

    User.create(
        :login => 'student1',
                        :first_name => 'kirouuuu',            
                :last_name => 'spirov', 
        :password => 'student1',
        :password_confirmation => 'student1',
        :email => 'student1@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(4)
    student.roles=student_role
    student.save
    
    Student.create(
                :user_id => '4',                  
                :grade => '100',                  
                :first_name => 'kirouuuu',            
                :last_name => 'spirov',                 
                :project_id => '')
            
    Wish.create(
            :student_id => '1',
            :project_id => '1',
            :wish => '1')
                      
    Wish.create(
            :student_id => '1',
            :project_id => '2',
            :wish => '2')
                      
    Wish.create(
            :student_id => '1',
            :project_id => '3',
            :wish => '3')
                                


 #**************************************************************************** 
 #Copies
        User.create(
        :login => 'student2',
        :first_name => 'mirouuuu',            
        :last_name => 'sadsfj',
        :password => 'student2',
        :password_confirmation => 'student2',
        :email => 'student2@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(5)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '5',                  
                :grade => '90',                  
                :first_name => 'mirouuuu',            
                :last_name => 'sadsfj',                 
                :project_id => '')
              
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

    
        User.create(
        :login => 'student3',
                        :first_name => 'ivan',            
                :last_name => 'spdfgdfgdhg', 
        :password => 'student3',
        :password_confirmation => 'student3',
        :email => 'student3@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(6)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '6',                  
                :grade => '80',                  
                :first_name => 'ivan',            
                :last_name => 'spdfgdfgdhg',                 
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
    

    
        User.create(
        :login => 'student4',
                        :first_name => 'petkan',            
                :last_name => 'mirov',
        :password => 'student4',
        :password_confirmation => 'student4',
        :email => 'student4@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(7)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '7',                  
                :grade => '70',                  
                :first_name => 'petkan',            
                :last_name => 'mirov',                 
                :project_id => '')
              
    

    
        User.create(
        :login => 'student5',
                        :first_name => 'zozo',            
                :last_name => 'gazov',
        :password => 'student5',
        :password_confirmation => 'student5',
        :email => 'student5@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(8)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '8',                  
                :grade => '60',                  
                :first_name => 'zozo',            
                :last_name => 'gazov',                 
                :project_id => '')
              
    

    
        User.create(
        :login => 'student6',
                        :first_name => 'mozo',            
                :last_name => 'bozov', 
        :password => 'student6',
        :password_confirmation => 'student6',
        :email => 'student6@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(9)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '9',                  
                :grade => '50',                  
                :first_name => 'mozo',            
                :last_name => 'bozov',                 
                :project_id => '')
              
    

    
        User.create(
        :login => 'student7',
                        :first_name => 'tup4o',            
                :last_name => 'pros4ev', 
        :password => 'student7',
        :password_confirmation => 'student7',
        :email => 'student7@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(10)
    student.roles=student_role
    student.save
    
        Student.create(
                :user_id => '10',                  
                :grade => '40',                  
                :first_name => 'tup4o',            
                :last_name => 'pros4ev',                 
                :project_id => '')

    
        User.create(
        :login => 'student8',
                        :first_name => 'stan4o',            
                :last_name => 'pan4ev', 
        :password => 'student8',
        :password_confirmation => 'student8',
        :email => 'student8@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(11)
    student.roles=student_role
    student.save

        Student.create(
                :user_id => '11',                  
                :grade => '30',                  
                :first_name => 'stan4o',            
                :last_name => 'pan4ev',                 
                :project_id => '')
              
            User.create(
        :login => 'student9',
                        :first_name => 'hop4o',            
                :last_name => 'kolev',
        :password => 'student9',
        :password_confirmation => 'student9',
        :email => 'student9@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(12)
    student.roles=student_role
    student.save


              
            User.create(
        :login => 'student10',
                        :first_name => 'opa',            
                :last_name => 'ras',
        :password => 'student10',
        :password_confirmation => 'student10',
        :email => 'student10@xyz.com')

    
    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(13)
    student.roles=student_role
    student.save


    
        User.create(
        :login => 'staff2',
        :password => 'staff2',
        :password_confirmation => 'staff2',
        :email => 'staff2@xyz.com',
        :first_name => 'paul',
        :last_name => 'cooks')
          User.create(
        :login => 'staff3',
        :password => 'staff3',
        :password_confirmation => 'staff3',
        :email => 'staff3@xyz.com',
        :first_name => 'remi',
        :last_name => 'lemir')
      
        staff_role = Role.find_by_sql("select id from roles where name='staff';")
    staff = User.find(14); # staff user
    staff.roles=staff_role
    staff.save
        staff_role = Role.find_by_sql("select id from roles where name='staff';")
    staff = User.find(15); # staff user
    staff.roles=staff_role
    staff.save
  end

  def self.down
    
  end
end
