class AddDisciplines < ActiveRecord::Migration
  def self.up
  	down
    d = Discipline.create :name=>"icct", :long_name=>"Information, Communication and Computing Technology"; d.save()
    d = Discipline.create :name=>"eee", :long_name=>"Electrical and Electronic Engineering"; d.save()
    d = Discipline.create :name=>"civ", :long_name=>"Civil Engineering"; d.save()
    d4 = Discipline.create :name=>"chem", :long_name =>"Chemical and Biochemical Engineering"; d.save()
  end

  def self.down
  	Discipline.delete_all
  end
end
