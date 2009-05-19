class UsersController < ApplicationController
<<<<<<< HEAD:app/controllers/users_controller.rb
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  require_role ["admin","coordinator","student","staff"], 
     :for => ["edit", "update"] 

  # render new.html.erb
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for registering. We'll be in touch when yur account is activated."
    else
      render :action => 'new'
    end
  end
  

 
 def edit
    @user = User.find(params[:id])
    @roles = {}
    Role.find(:all).collect {|r| @roles[r.name] = r.id }
    # edit only if administrator, or owner...
    unless (is_owner? or is_administrator?)
    	flash[:notice] = "You must be either logged in as #{@user.login} or an administrator to edit this user record."
    	redirect_to :action =>'show', id=>@user
    end
 end
  
  def update
    @user = User.find(params[:id])
    handle_user_roles
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action=>'show', id=>@user
    else
      render :action => 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
    def handle_user_roles
      if params['role_ids']
        @user.roles.clear
        roles = params['role_ids'].map { |id| Role.find(id) }
        @user.roles << roles
      end
    end
    
    def is_owner?
    	return (session[:user_id] == @user)
    end
    
    def is_administrator?(user)
    	return #
    end

=======
  
  skip_before_filter :login_required, :only => ["new", "create"]
  # TODO: handle other methods?
  # 
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We need to confim your status and will be in touch shortly."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/controllers/users_controller.rb
end
