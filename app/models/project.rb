class Project < ActiveRecord::Base
  belongs_to :user, :foreign_key => "created_by"
  has_one :student
  has_many :wishes
  has_and_belongs_to_many :disciplines

  
  validates_uniqueness_of :title, :scope => :title
  validates_presence_of     :title, :description

end
