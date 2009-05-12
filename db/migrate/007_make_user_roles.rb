class MakeUserRoles < ActiveRecord::Migration
  def self.up

    # admin user has admin (superuser) role
    assign_role('admin', 'Admin') 

    # dummy student user has student role
    assign_role('111111', 'student') 

    # dummy staff user has staff role
    assign_role('A.N.Academic', 'staff') 
    
    # dummy coordinator has staff and coordinatr roles
    assign_role('A.Coordinator', 'coordinator')
    assign_role('A.Coordinator', 'staff')  
    
    # this real user has admin, staff and coordinator role
    assign_role('C.P.Jobling', 'Admin')
    assign_role('C.P.Jobling', 'coordinator')
    assign_role('C.P.Jobling', 'staff')
  end

  def self.down
  end
  
  protected
  def self.assign_role(login, role) 
  	puts "Assigning role=#{role} to #{login}"
  	the_user = User.find_by_login(login)
  	the_user.add_role(role)
  	the_user.save
  end
end
