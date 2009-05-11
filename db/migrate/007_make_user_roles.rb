class MakeUserRoles < ActiveRecord::Migration
  def self.up

    # admin user has admin (superuser) role
    assign_role('admin', 'admin') 

    # dummy student user has student role
    assign_role('111111', 'student') 

    # dummy staff user has staff role
    assign_role('A.N.Academic', 'staff') 
    
    # dummy coordinator has staff and coordinatr roles
    assign_role('A.Coordinator', 'coordinator')
    assign_role('A.Coordinator', 'staff')  
    
    # this real user has admin, staff and coordinator role
    assign_role('C.P.Jobling', 'admin')
    assign_role('C.P.Jobling', 'coordinator')
    assign_role('C.P.Jobling', 'staff')
  end

  def self.down
  end
  
  protected
  def self.assign_role(login, role) 
  	the_user = User.find(:first, :conditions => ["login = ?", login])
  	the_role = Role.find(:first, :conditions => ["name = ?", role])
  	puts the_user.roles
  	the_user.roles << the_role
  	the_user.save
  end
end
