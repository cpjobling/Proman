<<<<<<< HEAD:app/controllers/application_controller.rb
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  before_filter :login_required

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
end
=======
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem

  before_filter :login_required
  helper_method :owner?
  helper_method :admin?
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  protected

  def owner?
    # TODO write this method
    true
  end

  def admin?
    # TODO write this method
    true
  end

end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/controllers/application_controller.rb
