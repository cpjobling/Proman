class Wish < ActiveRecord::Base
    belongs_to :student
    belongs_to :project
end
