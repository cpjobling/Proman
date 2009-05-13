require File.dirname(__FILE__) + '/../test_helper'
require 'project_controller'

class ProjectControllerTest < ActionController::TestCase

  fixtures :project

  def setup
    @controller = ProjectController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

end
