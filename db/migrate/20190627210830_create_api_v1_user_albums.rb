class CreateApiV1UserAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :user_albums do |t|
      t.integer :rating
      t.integer :user_id
      t.string :review
      t.boolean :listened_to
      t.datetime :date_listened_to
      t.string :spotify_id

      t.timestamps
    end
  end
end
