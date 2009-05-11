class MakeProjectDisciplines < ActiveRecord::Migration
  def self.up
    icct_discipline = Discipline.find_by_name('icct')
    proj = Project.new(:id => 11, :created_by => 5,
           :title => 'Project 11',
           :description => 'This is a dummy project proposed by the staff member with created_by = 5 (Dr C.P. Jobling).',
           :resources => 'none')
    puts proj.to_s
    proj.disciplines << icct_discipline
    proj.save

  end

  def self.down
  end
end
