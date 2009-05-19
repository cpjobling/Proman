<<<<<<< HEAD:test/functional/sessions_controller_test.rb
require 'test_helper'
=======
require File.dirname(__FILE__) + '/../test_helper'
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/sessions_controller_test.rb
require 'sessions_controller'

# Re-raise errors caught by the controller.
class SessionsController; def rescue_action(e) raise e end; end

class SessionsControllerTest < ActionController::TestCase

  fixtures :users

<<<<<<< HEAD:test/functional/sessions_controller_test.rb
  test "should login and redirect" do
    post :create, :login => '111111', :password => 'test'
    assert_response :redirect
    assert_redirected_to :controller => "gate", :action => "index"
  end
  
  test "successful login should set session[:user_id]" do
    post :create, :login => '111111', :password => 'test'
    assert session[:user_id]    
  end

   test "should confirm successful login" do
    post :create, :login => '111111', :password => 'test'
    assert_equal "Logged in successfully", flash[:notice]
  end
  
  test "should fail login and not redirect" do
    post :create, :login => '111111', :password => 'bad password'
    assert_nil session[:user_id]
    assert_response :success
    assert_template "new"
  end

  test "should fail login and not set session[:user_id]" do
    post :create, :login => '111111', :password => 'bad password'
    assert_nil session[:user_id]
  end
  
  test "should tell us that we have a bad login-pasword combination" do
    post :create, :login => '111111', :password => 'bad password'
    assert_equal "Invalid login or password", flash[:notice]
  end
  
  test "should logout" do
    login_as :student
=======
  def test_should_login_and_redirect
    post :create, :login => 'quentin', :password => 'monkey'
    assert session[:user_id]
    assert_response :redirect
  end

  def test_should_fail_login_and_not_redirect
    post :create, :login => 'quentin', :password => 'bad password'
    assert_nil session[:user_id]
    assert_response :success
  end

  def test_should_logout
    login_as :quentin
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/sessions_controller_test.rb
    get :destroy
    assert_nil session[:user_id]
    assert_response :redirect
  end

<<<<<<< HEAD:test/functional/sessions_controller_test.rb
  test "should remember me" do
    post :create, :login => '111111', :password => 'test', :remember_me => "1"
    assert_not_nil @response.cookies["auth_token"]
  end

  test "should not remember me" do
    post :create, :login => '111111', :password => 'test', :remember_me => "0"
    assert_nil @response.cookies["auth_token"]
  end
  
  test "should delete token on logout" do
    login_as :student
    get :destroy
    assert_nil @response.cookies["auth_token"]
  end

  test "should login with cookie" do
    users(:student).remember_me
    @request.cookies["auth_token"] = cookie_for(:student)
=======
  def test_should_remember_me
    @request.cookies["auth_token"] = nil
    post :create, :login => 'quentin', :password => 'monkey', :remember_me => "1"
    assert_not_nil @response.cookies["auth_token"]
  end

  def test_should_not_remember_me
    @request.cookies["auth_token"] = nil
    post :create, :login => 'quentin', :password => 'monkey', :remember_me => "0"
    puts @response.cookies["auth_token"]
    assert @response.cookies["auth_token"].blank?
  end
  
  def test_should_delete_token_on_logout
    login_as :quentin
    get :destroy
    assert @response.cookies["auth_token"].blank?
  end

  def test_should_login_with_cookie
    users(:quentin).remember_me
    @request.cookies["auth_token"] = cookie_for(:quentin)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/sessions_controller_test.rb
    get :new
    assert @controller.send(:logged_in?)
  end

<<<<<<< HEAD:test/functional/sessions_controller_test.rb
  test "should fail expired cookie login" do
    users(:student).remember_me
    users(:student).update_attribute :remember_token_expires_at, 5.minutes.ago
    @request.cookies["auth_token"] = cookie_for(:student)
=======
  def test_should_fail_expired_cookie_login
    users(:quentin).remember_me
    users(:quentin).update_attribute :remember_token_expires_at, 5.minutes.ago
    @request.cookies["auth_token"] = cookie_for(:quentin)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/sessions_controller_test.rb
    get :new
    assert !@controller.send(:logged_in?)
  end

<<<<<<< HEAD:test/functional/sessions_controller_test.rb
  test "should fail cookie login" do
    users(:student).remember_me
=======
  def test_should_fail_cookie_login
    users(:quentin).remember_me
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/sessions_controller_test.rb
    @request.cookies["auth_token"] = auth_token('invalid_auth_token')
    get :new
    assert !@controller.send(:logged_in?)
  end

  protected
    def auth_token(token)
      CGI::Cookie.new('name' => 'auth_token', 'value' => token)
    end
    
    def cookie_for(user)
      auth_token users(user).remember_token
    end
end
