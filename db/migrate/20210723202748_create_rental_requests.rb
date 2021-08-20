class CreateRentalRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_requests do |t|
      t.string :status, default: "Pending"
      t.string :message
      t.date :start_date
      t.date :end_date
      t.references :video_game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
