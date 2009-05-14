class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  require_role "Admin", :for => :edit 

  # render new.rhtml
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

end
