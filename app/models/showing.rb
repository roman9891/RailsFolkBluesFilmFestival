class Showing < ApplicationRecord
    belongs_to :movie
    has_many :comments
    #validates :time, uniqueness

    def self.today
        Showing.find_by(time: Date.today)
    end

    def self.this_week
       Showing.all.select do |show|
            show.time >= Date.today && show.time <= (Date.today+7)
       end
    end
end
