class Branch < ActiveRecord::Base
    has_many :company_branches
    has_many :companies, through: :company_branches
    has_many :users
    validates :name, presence: true, length: { minimum: 2, maximum: 25 }
end