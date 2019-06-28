class CreateApiV1Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :create
      t.string :access_token 
      t.string :refresh_token
      t.string :spotify_id
      t.timestamps
    end
  end
end
