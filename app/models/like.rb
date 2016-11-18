class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :company
    
    validates_uniqueness_of :user, scope: :company
    
end