# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

<<<<<<< HEAD:app/controllers/sessions_controller.rb
  skip_before_filter :login_required, :except => :destroy # turn off most login checks in this controller
=======
  skip_before_filter :login_required
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/controllers/sessions_controller.rb
  
  # render new.rhtml
  def new
  end

  def create
<<<<<<< HEAD:app/controllers/sessions_controller.rb
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { 
        	:value => self.current_user.remember_token , 
        	:expires => self.current_user.remember_token_expires_at 
    	}
      end
      flash[:login_message] = "Logged in successfully"
      redirect_back_or_default('/')
    else
      flash[:login_message] = "Invalid login or password"
=======
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = "Logged in successfully"
    else
      flash[:notice] = "Login or password not recognized. Your login attempt has been logged."
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/controllers/sessions_controller.rb
      render :action => 'new'
    end
  end

  def destroy
<<<<<<< HEAD:app/controllers/sessions_controller.rb
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to :controller => "sessions", :action => "destroy"
=======
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/controllers/sessions_controller.rb
  end
end
