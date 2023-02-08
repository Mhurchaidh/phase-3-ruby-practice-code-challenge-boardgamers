class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :boardgame_id
      t.integer :player_id
      t.integer :hours_played
      t.string :content
    end
  end
end
