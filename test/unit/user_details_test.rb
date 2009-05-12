require File.dirname(__FILE__) + '/../test_helper'

class UserDetailsTest < Test::Unit::TestCase
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
  		:staff_or_student_name => "777777",
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
  		:staff_or_student_name => "777777",
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
end
