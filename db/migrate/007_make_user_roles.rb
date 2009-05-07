class MakeUserRoles < ActiveRecord::Migration
  def self.up
    admin_role = Role.find_by_sql("select id from roles where name='admin';")
    student_role = Role.find_by_sql("select id from roles where name='student';")
    staff_role = Role.find_by_sql("select id from roles where name='staff';")
    coordinator_role = Role.find_by_sql("select id from roles where name='coordinator';")

    admin = User.find(1); # admin user
    # has admin (superuser) role
    admin.roles=admin_role
    admin.save

    student = User.find(2); # dummy student user
    # has student role
    student.roles=student_role
    student.save

    staff = User.find(3); # dummy staff user
    # has staff role
    staff.roles=staff_role
    staff.save
    
    coordinator = User.find(4); # dummy coordinator user
    # has staff and coordinatr roles
    coordinator.roles=staff_role
    coordinator.roles=coordinator_role
    coordinator.save
    
    cpj = User.find(5); # Real project coordinator user (Dr C.P. Jobling)
    # has admin, coordinator and staff roles.
    cpj.roles=staff_role
    cpj.roles=coordinator_role
    cpj.roles=admin_role
    cpj.save
  end

  def self.down
  end
end
