<<<<<<< HEAD:app/models/role.rb
class Role < ActiveRecord::Base
  
=======
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/models/role.rb
end