class Post < ApplicationRecord

  belongs_to :camper#, foreign_key: [:cumper_name,:caption]

  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, -> { order(:created_at => :desc) }, dependent: :destroy

  accepts_nested_attributes_for :photos

   def self.looks(searches, words)
    if searches == "perfect_match"
      @post = Post.where("caption LIKE ?", "#{words}")
    else
      @post = Post.where("caption LIKE ?", "%#{words}%")
    end
  end

  def taken_comments
    comments.take(2)
  end

  def liked_by?(camper)
    likes.where(camper_id: camper.id,).exists?
  end

  def is_belongs_to?(camper)
    Post.find_by(camper_id: camper.id, id: id)
  end

end
