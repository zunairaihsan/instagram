class Accountpost < ApplicationRecord
    
    
    acts_as_votable
    belongs_to :account
    has_many :comments, -> {order(:created_at => :desc)}, dependent: :destroy
    has_many_attached :images 
    

end
