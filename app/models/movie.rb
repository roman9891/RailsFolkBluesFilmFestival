class Movie < ApplicationRecord
    has_one :showing
    belongs_to :user
    has_one_attached :poster
    
    validates :title, :url, presence: true
    #validates :url, uniqueness: true
    #before_save :parse_url
    validates :url, format: {with: /src=/, message: "missing source link"}

    def parse_url
        mostly_parsed_url = self.url[/src=".+?(?=")/].delete_prefix("src=") 
        url_length = mostly_parsed_url.length
        self.url = mostly_parsed_url[1,url_length]
    end

    def self.accepted
        Movie.all.select{ |movie| movie.acceptance_status == "accepted"}
    end


end
