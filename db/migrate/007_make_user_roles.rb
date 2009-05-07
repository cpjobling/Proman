class MakeUserRoles < ActiveRecord::Migration
  def self.up
    admin_role = Role.find_by_sql("select id from roles where name='admin';")
    admin = User.find(1); # admin user
    admin.roles=admin_role
    admin.save

    student_role = Role.find_by_sql("select id from roles where name='student';")
    student = User.find(2); # student user
    student.roles=student_role
    student.save

    staff_role = Role.find_by_sql("select id from roles where name='staff';")
    staff = User.find(3); # staff user
    staff.roles=staff_role
    staff.save
  end

  def self.down
  end
end
