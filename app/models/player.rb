class Player < ActiveRecord::Base
    has_many :reviews
    has_many :boardgames, through: :reviews

    def full_name
        self.first_name + " " + self.last_name
    end

    def favorite_game
        boardgames.find(reviews.max_by do |r| r.hours_played end.boardgame_id).name
    end

    def add_review boardgame, content, hours_played
        Review.create(
            boardgame_id: boardgame.id,
            player_id: self.id,
            hours_played: hours_played,
            content: content
        )
    end

    def play_game boardgame
        game_reviews = reviews.where(boardgame_id: boardgame.id)
        game_reviews.each do |game| game.increment!(:hours_played) end
    end
end
