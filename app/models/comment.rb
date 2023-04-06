class Comment < ApplicationRecord
  
  belongs_to :camper
  
  belongs_to :post
end
