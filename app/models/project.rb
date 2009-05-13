class Project < ActiveRecord::Base
  belongs_to :user, :foreign_key => "created_by"
  has_one :student
  has_many :wishes
  has_and_belongs_to_many :disciplines

  
  validates_uniqueness_of :title, :scope => :title
  validates_presence_of   :title, :description, :created_by
  
  # Test that project is suitable for a discipline
  def suitable_for?(discipline)
    return self.disciplines.find_by_name(discipline)
  end
  
  # Convenience method to test if a project is suitable for all disciplines
  def suitable_for_all?
  	return self.disciplines.count(:all) == Discipline.count(:all)
  end

  # Convenience method to test if a project is suitable for any discipline
  def suitable_for_any?
  	return self.disciplines.count > 0
  end
  
  # Convenience method to make project suitable for all disciplies
  
  # Convenience method to add make a project suitable for a named discipline
  def suitable_for(discipline)
  	if ! self.suitable_for?(discipline)
  		if the_discipline = Discipline.find_by_name(discipline)
  		  self.disciplines << the_discipline
  		end
  	end
  end
end
