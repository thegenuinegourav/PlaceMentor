class Company < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :companyname, presence: true, length: { minimum: 3 ,maximum: 100 }
    validates :location, presence: true, length: { minimum: 5, maximum: 300 }
    validates :package, presence: true
    validates :description, presence: true, length: {minimum: 10, maximum: 1000 }
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
    def picture_size 
      if picture.size > 5.megabytes
        errors.add(:picture,"should be less than 5MB")
      end
    end
end