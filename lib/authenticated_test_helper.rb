module AuthenticatedTestHelper
  # Sets the current user in the session from the user fixtures.
  def login_as(user)
<<<<<<< HEAD:lib/authenticated_test_helper.rb
    @request.session[:user_id] = user ? users(user).id : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
=======
    @request.session[:user_id] = user ? (user.is_a?(User) ? user.id : users(user).id) : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'monkey') : nil
  end
  
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:lib/authenticated_test_helper.rb
end
