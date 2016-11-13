class Company < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :companyname, presence: true, length: { minimum: 3 ,maximum: 100 }
    validates :location, presence: true, length: { minimum: 10, maximum: 300 }
    validates :package, presence: true
    validates :description, presence: true, length: {minimum: 10, maximum: 1000 }
    validates_format_of :date, presence: true, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"
end