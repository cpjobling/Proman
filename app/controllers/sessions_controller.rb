# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  skip_before_filter :login_required, :except => :destroy # turn off most login checks in this controller
  
  # render new.rhtml
  def new
  end

  def create
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
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to :controller => "sessions", :action => "destroy"
  end
end
