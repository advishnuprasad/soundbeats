class CreateAlbumsArtistsTable < ActiveRecord::Migration
  def up
    create_table :albums_artists, :id => false do |t|
      t.references :album
      t.references :artist
    end
  end

  def down
    drop_table :albums_artists
  end
end
