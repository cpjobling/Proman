require File.dirname(__FILE__) + '/../test_helper'

class UserDetailsTest < ActiveSupport::TestCase
  # Tests the basic function of the user classes ...
  # see user_test.rb for tests of restful authentication functionality
  fixtures :users, :roles

  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_invalid_with_empty_atributes
  	user = User.new
  	assert !user.valid?
  	assert user.errors.invalid?(:login)
  	assert user.errors.invalid?(:email)
  	assert user.errors.invalid?(:first_name)
  	assert user.errors.invalid?(:last_name)
    assert user.errors.invalid?(:staff_or_student_number)
  end
  
  def test_unique_login
  	user = User.new(:login => users(:academic).login,
  		:email => "academic@xyz.com",
  		:first_name => "Jools",
  		:last_name => "Holland",
  		:staff_or_student_number => "777777",
  		:password => "test",
  		:password_confirmation => "test")
  		
  	assert !user.save
  	assert_equal "has already been taken", user.errors.on(:login)
  end
  
  def test_unique_email
  	user = User.new(:login => "newuser",
  		:email => users(:student).email,
  		:first_name => "Herman",
  		:last_name => "Munster",
  		:staff_or_student_number => "777777",
  		:password => "test",
  		:password_confirmation => "test")
  		
  	assert !user.save
  	assert_equal "has already been taken", user.errors.on(:email)
  end
  
  def test_unique_staff_or_student_number
  	user = User.new(:login => "newuser",
  		:email => users(:student).email,
  		:first_name => "Lillian",
  		:last_name => "Gish",
  		:staff_or_student_number => 
  		         users(:coordinator).staff_or_student_number,
  		:password => "test",
  		:password_confirmation => "test")
  		
  	assert !user.save
  	assert_equal "has already been taken", 
  	        user.errors.on(:staff_or_student_number)
  end
  
  def test_new_user_has_no_role_assigned
  	guest = users(:student)
  	
  	roles = Role.find(:all)
  	roles.each do |role| 
  		assert !guest.has_role?(role), "Should not have role #{role.to_s}"
  	end
  end
  
  def test_new_user_is_not_admin
  	guest = users(:academic)
  	assert !guest.has_role?('Admin'), "Guest user shouldn't have admin role"
  end
  
  def test_admin_user_has_admin_role
  	admin = users(:admin)
  	assert admin.has_role?('Admin'), "admin user should have the 'Admin' role"	
  end
  
  def test_student_user_should_have_student_role
  	user = users(:student)
  	assert user.has_role?('student'), "user should have student role"
  end
  
  def test_academic_user_should_have_staff_role
  	user = users(:academic)
  	assert user.has_role?('staff'), "user should have staff role"
  end
  
  def test_coordinator_user_should_have_staff_and_coordinator_roles
  	user = users(:coordinator)
  	assert user.has_role?('coordinator'), 
  	     "user should have coordinator role"
  	assert user.has_role?('staff'), "user should have staff role"
  end
  
  def test_add_role
  	 user = User.create(:login => "newuser",
  		:email => "newuser@xyz.com",
  		:first_name => "Bernard",
  		:last_name => "Manning",
  		:staff_or_student_number => "777777",
  		:password => "test",
  		:password_confirmation => "test")
  		
  	 roles = Role.find(:all)
  	 roles.each do |role|
  		assert !user.has_role?(role.name), 
            "Shouldn't yet have role #{role.name}"
  		user.add_role(role.name)
  		assert user.has_role?(role.name),
  		    "Should now have role #{role.name}"
  	end
  end
  
end
