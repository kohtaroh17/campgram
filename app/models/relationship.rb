class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "Camper"
  belongs_to :followed, class_name: "Camper"
  
  
end
