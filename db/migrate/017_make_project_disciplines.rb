class MakeProjectDisciplines < ActiveRecord::Migration
  def self.up
    icct_discipline = Discipline.find_by_sql("select id from disciplines where name='icct';")
    proj = Project.find(1); # admin user
    proj.disciplines=icct_discipline
    proj.save

  end

  def self.down
  end
end
