class CreateArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :age
      t.references :movies_songs, foreign_key: true
    end
  end
end
