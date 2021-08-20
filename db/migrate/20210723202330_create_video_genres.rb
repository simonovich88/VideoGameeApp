class CreateVideoGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :video_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :video_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
