require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < ActiveSupport::TestCase
	
  fixtures :users, :projects
  
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  # Test validation rules
  def test_invalid_with_empty_atributes
  	project = Project.new
  	assert !project.valid?
  	assert project.errors.invalid?(:title)
  	assert project.errors.invalid?(:description)
  	assert project.errors.invalid?(:created_by)
  end
  
  def test_unique_title
  	project = Project.new(:title => projects(:project1).title,
  		:description => "A dummy project",
  		:created_by => users(:academic).id)
  		
  	assert !project.save
  	assert_equal "has already been taken", project.errors.on(:title)
  end
  
  def test_project_creator_is_valid
      users = User.find(:all)
      users.each do |user|
      	if user.has_role?('staff')
			projects = Project.find(:all, 
			   :conditions => ["created_by = ?", user.id])
			projects.each do |project|
				assert_equal project.created_by, user.id, 
				   "user didn't create project" 
			end
      	end	
  	  end
  end
end
