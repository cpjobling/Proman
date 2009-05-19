<<<<<<< HEAD:test/functional/projects_controller_test.rb
require 'test_helper'
require 'projects_controller'

class ProjectsControllerTest < ActionController::TestCase

  fixtures :projects, :users, :roles, :user_roles

  def setup
    @controller = ProjectsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  def test_get_index
    get :index
    assert_response :success
  end
  
 test "should get index" do
=======

# require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  fixtures :users, :projects, :disciplines

  def setup
    login_as users(:admin)
  end

  test "should get index" do
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
  	login_as :academic
=======
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    get :new
    assert_response :success
  end

  test "should create project" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
  	login_as :academic
    assert_difference('Project.count') do
      post :create, :project => {:title => "A test project",
      :description => "A dummy project",
      :created_by => users(:academic).id}
=======
    assert_difference('Project.count') do
      post :create, :project => { :title=> "test", :description=>"test", :created_by=>users(:admin).id }
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
    get :show, :id => projects(:project1).id
=======
    get :show, :id => projects(:project1).to_param
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    assert_response :success
  end

  test "should get edit" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
  	login_as :academic
    get :edit, :id => projects(:project1).id
=======
    get :edit, :id => projects(:project1).to_param
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    assert_response :success
  end

  test "should update project" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
  	login_as :academic
    put :update, :id => projects(:project1).id, :project => { }
=======
    put :update, :id => projects(:project1).to_param, :project => { }
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
<<<<<<< HEAD:test/functional/projects_controller_test.rb
  	login_as :academic
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:project1).id
=======
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:project1).to_param
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_test.rb
    end

    assert_redirected_to projects_path
  end
end
