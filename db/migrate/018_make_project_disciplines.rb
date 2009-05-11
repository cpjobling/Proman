class MakeProjectDisciplines < ActiveRecord::Migration
  def self.up
    icct_discipline = Discipline.find_by_name('icct')
    proj = Project.find(10)
    puts proj.to_s
    proj.disciplines << icct_discipline
    proj.save

  end

  def self.down
  end
end
