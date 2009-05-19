<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
=======
# Tests project access rules
#
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
require 'test_helper'
require 'projects_controller'

class ProjectsControllerAccessRulesTest < ActionController::TestCase

<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  fixtures :projects, :users, :roles, :user_roles
=======
  fixtures :projects, :users, :roles, :roles_users
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb

  def setup
    @controller = ProjectsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "anyone should be able to access index" do
    assert_users_access(
      {:admin => true, :academic => true, :student => true, :coordinator => true, :new_user => true}, # accessible to all
      "index"          # test the index action
    )
    get :index # also open to public
    assert_response :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "anyone should be able to access by_supervisor" do
    assert_users_access(
      {:admin => true, :academic => true, :student => true, :coordinator => true, :new_user => true}, # accessible to all
      "by_supervisor"  # by_supervisor
    )
    get :by_supervisor # also open to public
    assert_response :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "anyone should be able to access by_discipline" do
    assert_users_access(
      {:admin => true, :academic => true, :student => true, :coordinator => true, :new_user => true}, # accessible to all
      "by_discipline"  # by_discipline
    )
    get :by_discipline # also open to public
    assert_response :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "anyone should be able to access by_centre" do
    assert_users_access(
      {:admin => true, :academic => true, :student => true, :coordinator => true, :new_user => true}, # accessible to all
      "by_centre"     # by_centre
    )
    get :by_centre # also open to public
    assert_response :success
  end

  test "anyone should be able to access show project" do
    assert_users_access(
      {:admin => true, :academic => true, :student => true, :coordinator => true, :new_user => true}, # accessible to all
      "show",     # by_centre
      :id => projects(:project1).id
    )
    get :show, :id => projects(:project1).id # also open to public
    assert_response :success
  end

  test "only staff users should get new" do
    assert_users_access(
      {:admin => true, :academic => true, :coordinator => true, :student => false, :new_user => false}, # accessible logged in staff
      "new"
    )
  end

  test "must be logged in" do
  	get :new
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
    assert_equal "You must be logged in to add a new project", flash[:error]
    assert_redirected_to login_path
  end
  
  test "student cant add a new project" do
    login_as :student
    get :new
    assert_equal "You must be a member of staff to add a project", flash[:error]
    assert_redirected_to(:back)
  end
  
=======
    assert_redirected_to new_session_path
  end

  test "student cant add a new project" do
    login_as :student
    get :new
    assert_response :unauthorized
  end

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "staff can add a new project" do
    login_as :academic
    get :new
    assert :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "coordinator can add a new project" do
    login_as :coordinator
    get :new
    assert :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
    test "admin can add a new project" do
=======

  test "admin can add a new project" do
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
    login_as :admin
    get :new
    assert :success
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
  
=======

>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
  test "should create project" do
  	login_as :academic
    assert_difference('Project.count') do
      post :create, :project => {:title => "A test project",
      :description => "A dummy project",
      :created_by => users(:academic).id}
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should get edit" do
  	login_as :academic
    get :edit, :id => projects(:project1).id
    assert_response :success
  end

  test "should update project" do
  	login_as :academic
    put :update, :id => projects(:project1).id, :project => { }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
  	login_as :academic
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:project1).id
    end

    assert_redirected_to projects_path
  end
<<<<<<< HEAD:test/functional/projects_controller_access_rules_test.rb
=======

  test "staff can only destroy own project" do
    assert true # TODO write this test
  end

  test "staff can only update own project" do
    assert true # TODO write this test
  end

  test "staff can only edit own project" do
    assert true # TODO write this test
  end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:test/functional/projects_controller_access_rules_test.rb
end
