require File.dirname(__FILE__) + '/../test_helper'

class DisciplineTest < ActiveSupport::TestCase
  fixtures :projects, :disciplines
  
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_project_discipline_is_a_discipline
    # test that adding a discipline adds the discipline
    @project.suitable_for(@icct)
    assert @project in @icct.projects.find_all
  end
  
  
  
  
end
