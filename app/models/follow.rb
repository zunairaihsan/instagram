class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'Account'
    belongs_to :followee, class_name: 'Account'

    validates :follower_id, uniqueness: { scope: :followee_id }
    validates :followee_id, uniqueness: { scope: :follower_id }
end
