class Review < ActiveRecord::Base
    belongs_to :boardgame
    belongs_to :player

    def full_review
        "Review for #{boardgame.name} by #{player.first_name + " " + player.last_name}: #{self.content}"
    end
end