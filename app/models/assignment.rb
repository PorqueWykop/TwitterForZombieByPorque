class Assignment < ActiveRecord::Base
  attr_accessible :role_id, :zombie_id

  belongs_to :zombie
  belongs_to :role
  
end
