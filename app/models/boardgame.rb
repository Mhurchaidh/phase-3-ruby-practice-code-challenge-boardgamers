class Boardgame < ActiveRecord::Base
    has_many :reviews
    has_many :players, through: :reviews

    def self.oldest
        self.all.min_by do |g| g.year_released end
    end

    def all_full_reviews
        reviews.map do |r| r.full_review end
    end
end
