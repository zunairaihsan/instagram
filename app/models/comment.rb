class Comment < ApplicationRecord
    belongs_to :accountpost
    belongs_to :account
end
