# This will delete any existing rows from the Boardgame and Player tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Boardgame/Player data..."
Boardgame.destroy_all
Player.destroy_all
Review.destroy_all

puts "Creating boardgames..."
catan = Boardgame.create(name: "Settlers of Catan", year_released: 1995)
uno = Boardgame.create(name: "Uno", year_released: 1971)
smallworld = Boardgame.create(name: "Smallworld", year_released: 2009)
chess = Boardgame.create(name: "Chess", year_released: 840)
# yes I know chess was around before then but this was the year the oldest known chess manual
# was written by al-Adli ar-Rumi

puts "Creating players..."
chett = Player.create(first_name: "Chett", last_name: "Tiller")
octavia = Player.create(first_name: "Octavia", last_name: "Butler")
ursula = Player.create(first_name: "Ursula", last_name: "Le Guin")

puts "Creating reviews..."
# ********************************************************************
# * TODO: create reviews! Remember, a review belongs to a boardgame *
# * and a review belongs to a player.                              *
# ********************************************************************
# Create reviews Here

puts "Generating Reviews..."
10.times {
    Review.create(
        boardgame_id: Boardgame.all.sample.id,
        player_id: Player.all.sample.id,
        hours_played: rand(5..50),
        content: Faker::Fantasy::Tolkien.poem
    )
}

puts "Seeding done!"
