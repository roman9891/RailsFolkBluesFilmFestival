class Movie < ApplicationRecord
    has_one :showing
    belongs_to :user
end
