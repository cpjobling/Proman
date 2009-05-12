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
  end
  
end
