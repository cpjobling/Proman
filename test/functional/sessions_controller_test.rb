require 'test_helper'
require 'sessions_controller'

# Re-raise errors caught by the controller.
class SessionsController; def rescue_action(e) raise e end; end

class SessionsControllerTest < ActionController::TestCase

  fixtures :users

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
    get :destroy
    assert_nil session[:user_id]
    assert_response :redirect
  end

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
    get :new
    assert @controller.send(:logged_in?)
  end

  test "should fail expired cookie login" do
    users(:student).remember_me
    users(:student).update_attribute :remember_token_expires_at, 5.minutes.ago
    @request.cookies["auth_token"] = cookie_for(:student)
    get :new
    assert !@controller.send(:logged_in?)
  end

  test "should fail cookie login" do
    users(:student).remember_me
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
