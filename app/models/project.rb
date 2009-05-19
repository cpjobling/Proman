class Project < ActiveRecord::Base
<<<<<<< HEAD:app/models/project.rb
  belongs_to :user, :foreign_key => "created_by"
  has_one :student
  has_many :wishes
  has_and_belongs_to_many :disciplines

  
  validates_uniqueness_of :title, :scope => :title
  validates_presence_of   :title, :description, :created_by
  
  # Test that project is suitable for a discipline
  def suitable_for?(discipline)
    return self.disciplines.find_by_name(discipline)
=======
  has_and_belongs_to_many :disciplines

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :description
  validates_presence_of :created_by
  # TODO: validator should check that at least one discipline has been specified
	  
  # Helper methods
  
  # Test that project is suitable for a discipline
  def suitable_for?(discipline)
    name = name_discipline(discipline)
    count = self.disciplines.count(:conditions => ['name = ?', name])
    return count > 0
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/models/project.rb
  end
  
  # Convenience method to test if a project is suitable for all disciplines
  def suitable_for_all?
<<<<<<< HEAD:app/models/project.rb
  	return self.disciplines.count(:all) == Discipline.count(:all)
=======
   	return self.disciplines.count(:all) == Discipline.count(:all)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/models/project.rb
  end

  # Convenience method to test if a project is suitable for any discipline
  def suitable_for_any?
  	return self.disciplines.count > 0
  end
  
  # Convenience method to make project suitable for all disciplies
  def suitable_for_all
  	disciplines = Discipline.find(:all)
  	disciplines.each do |discipline|
  		self.suitable_for(discipline.name)
  	end
  end
  
  # Convenience method to add make a project suitable for a named discipline
  def suitable_for(discipline)
<<<<<<< HEAD:app/models/project.rb
  	if ! self.suitable_for?(discipline)
  		if the_discipline = Discipline.find_by_name(discipline)
=======
    discipline_by_name = name_discipline(discipline)
    return unless discipline_by_name
  	unless  self.suitable_for?(discipline_by_name)
  		if the_discipline = Discipline.find_by_name(discipline_by_name)
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/models/project.rb
  		  self.disciplines << the_discipline
  		end
  	end
  end
  
  # Convenience method to determine if a project is suitable for no disciplines.
  # That is has not been assigned to any disciplines.
  def suitable_for_none?
  	return self.disciplines.empty?
  end
  
  # Convenience method to clear suitability record, e.g. when resetting
  # disciplines in an update method
  def suitable_for_none
  	self.disciplines.delete_all
  end
<<<<<<< HEAD:app/models/project.rb
=======

  private

  def name_discipline(discipline)
    return discipline.name if discipline.class == Discipline
    return Discipline.find(discipline).name if discipline.class == Fixnum
    return discipline if discipline.class == String
    return ""
  end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/models/project.rb
end
