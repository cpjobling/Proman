require File.dirname(__FILE__) + '/../test_helper'
require 'project_controller'

class ProjectControllerTest < ActionController::TestCase

  fixtures :projects

  def setup
    @controller = ProjectController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_get_index
  	get :index
  	assert_response :success
  end
  
end
