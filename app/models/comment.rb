class Comment < ApplicationRecord
    belongs_to :showing
    belongs_to :user
end
