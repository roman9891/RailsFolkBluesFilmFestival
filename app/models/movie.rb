class Movie < ApplicationRecord
    has_one :showing
    belongs_to :user
    validates :title, :url, presence: true
    validates :title, uniqueness: true
    #before_save :parse_url
    #validates :url, format: {with: regex, message: ""}

    def parse_url
        mostly_parsed_url = self.url[/src=".+?(?=")/].delete_prefix("src=") 
        url_length = mostly_parsed_url.length
        self.url = mostly_parsed_url[1,url_length]
    end
end
