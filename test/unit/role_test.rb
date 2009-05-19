require File.dirname(__FILE__) + '/../test_helper'

<<<<<<< HEAD:test/unit/role_test.rb
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/role_test.rb
class RoleTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  def test_admin_role_exists
    admin_role = Role.find_by_name('admin')
    assert_not_nil admin_role, "There needs to be an admin role" 
  end
  
  def test_key_roles_exist
  	['student', 'staff', 'coordinator'].each do |role|
  		assert_not_nil role, "Role #{role} is needed for this application to work"
  	end
  end
end
