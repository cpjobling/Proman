class AddDisciplines < ActiveRecord::Migration
  def self.up
    d1 = Discipline.create :name=>"icct";
    d2 = Discipline.create :name=>"eee";
    d3 = Discipline.create :name=>"civil";
    d4 = Discipline.create :name=>"chemical";
    
    d1.save();
    d2.save();
    d3.save();
    d4.save();
  end

  def self.down
  end
end
