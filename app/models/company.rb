class Company < ActiveRecord::Base
    belongs_to :user
    has_many :likes
    has_many :company_branches
    has_many :branches, through: :company_branches
    validates :user_id, presence: true
    validates :companyname, presence: true, length: { minimum: 3 ,maximum: 100 }
    validates :location, presence: true, length: { minimum: 5, maximum: 300 }
    validates :package, presence: true
    validates :description, presence: true, length: {minimum: 10, maximum: 1000 }
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
     default_scope -> { order(updated_at: :desc) }
    
    def count_one_stars
      self.likes.where(like: 1).size
    end
    
    def count_two_stars
      self.likes.where(like: 2).size
    end
    
    def count_three_stars
      self.likes.where(like: 3).size
    end
    
    def count_four_stars
      self.likes.where(like: 4).size
    end
    
    def count_five_stars
      self.likes.where(like: 5).size
    end
    
    def rating
      ((count_one_stars + 2*count_two_stars + 3*count_three_stars + 4*count_four_stars + 5*count_five_stars)/self.likes.size.to_f).round(1)
    end
    
    private
    def picture_size 
      if picture.size > 5.megabytes
        errors.add(:picture,"should be less than 5MB")
      end
    end
end