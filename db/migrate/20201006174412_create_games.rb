class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.integer :user_id
      t.integer :rating_id
      t.timestamps
    end
  end
end
