class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :wishes
  
  validates_presence_of     :grade
  validates_inclusion_of    :grade, :in => 30..100
  
  def apply_projects(student_id, wishes, tour)
    wishes.each do |x|
      connection.execute("INSERT INTO `wishes` (student_id, project_id, wish, tour) VALUES ('#{student_id}', '#{x[0]}', '#{x[1]}', '#{tour}')")
    end
  end
  
  def allocate_project(project_id)
    self.project_id = project_id
    begin
      self.save!
      ProjectWish.delete_all(:conditions => "project_id=#{project_id}")
    rescue Exception
      # handle exceptin
    end
  end
  
end