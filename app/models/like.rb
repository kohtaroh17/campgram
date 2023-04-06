class Like < ApplicationRecord
  
  belongs_to :camper
  
  belongs_to :post
  
  validates :camper_id, uniqueness: { scope: :post_id }


end
