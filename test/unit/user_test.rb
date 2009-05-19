require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :users

  def test_should_create_user
    assert_difference 'User.count' do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'User.count' do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference 'User.count' do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'User.count' do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'User.count' do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
<<<<<<< HEAD:test/unit/user_test.rb
    users(:academic).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:academic), User.authenticate('A.N.Academic', 'new password')
  end

  def test_should_not_rehash_password
    users(:academic).update_attributes(:login => 'quentin2')
    assert_equal users(:academic), User.authenticate('quentin2', 'test')
  end

  def test_should_authenticate_user
    assert_equal users(:academic), User.authenticate('A.N.Academic', 'test')
  end

  def test_should_set_remember_token
    users(:academic).remember_me
    assert_not_nil users(:academic).remember_token
    assert_not_nil users(:academic).remember_token_expires_at
  end

  def test_should_unset_remember_token
    users(:academic).remember_me
    assert_not_nil users(:academic).remember_token
    users(:academic).forget_me
    assert_nil users(:academic).remember_token
=======
    users(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:quentin), User.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    users(:quentin).update_attributes(:login => 'quentin2')
    assert_equal users(:quentin), User.authenticate('quentin2', 'monkey')
  end

  def test_should_authenticate_user
    assert_equal users(:quentin), User.authenticate('quentin', 'monkey')
  end

  def test_should_set_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    users(:quentin).forget_me
    assert_nil users(:quentin).remember_token
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/user_test.rb
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
<<<<<<< HEAD:test/unit/user_test.rb
    users(:academic).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil users(:academic).remember_token
    assert_not_nil users(:academic).remember_token_expires_at
    assert users(:academic).remember_token_expires_at.between?(before, after)
=======
    users(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/user_test.rb
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
<<<<<<< HEAD:test/unit/user_test.rb
    users(:academic).remember_me_until time
    assert_not_nil users(:academic).remember_token
    assert_not_nil users(:academic).remember_token_expires_at
    assert_equal users(:academic).remember_token_expires_at, time
=======
    users(:quentin).remember_me_until time
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert_equal users(:quentin).remember_token_expires_at, time
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/user_test.rb
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
<<<<<<< HEAD:test/unit/user_test.rb
    users(:academic).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil users(:academic).remember_token
    assert_not_nil users(:academic).remember_token_expires_at
    assert users(:academic).remember_token_expires_at.between?(before, after)
=======
    users(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/user_test.rb
  end

protected
  def create_user(options = {})
<<<<<<< HEAD:test/unit/user_test.rb
    record = User.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire', :staff_or_student_number => '9899898', :first_name => 'Fred', :last_name => 'Bloggs' }.merge(options))
=======
    record = User.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    name = Name.new("Dr", "Theodora", "G.", "Testmeister", "Theo")
    record.name = name
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/unit/user_test.rb
    record.save
    record
  end
end
