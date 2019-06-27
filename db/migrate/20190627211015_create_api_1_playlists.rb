class CreateApi1Playlists < ActiveRecord::Migration[5.2]
  def change
    create_table :api_1_playlists do |t|
      t.string :name
      t.string :image
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
