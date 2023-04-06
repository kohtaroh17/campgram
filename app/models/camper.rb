class Camper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  
  has_many :comment, dependent: :destroy
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @camper = Camper.where("camper_name LIKE ?", "#{words}")
    else
      @camper = Camper.where("camper_name LIKE ?", "%#{words}%")
    end
  end
  
  def follow(camper_id)
   relationships.create(followed_id: camper_id)
  end
  # フォローを外すときの処理
  def unfollow(camper_id)
    relationships.find_by(followed_id: camper_id).destroy
  end
  # フォローしているか判定
  def following?(camper)
    followings.include?(camper)
  end

  
  
  def liked_by?(post_id)
   likes.where(post_id: post_id).exists?
  end
  
  has_one_attached :image
  
  has_one_attached :profiel_image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
    def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
    end
    
     def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height ]).processed
    end
end
