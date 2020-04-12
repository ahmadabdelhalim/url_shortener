class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :url_shortener_shortened_urls do |t|
      t.text :full_link, null: false, length: 2083
      t.string :shortened_link

      t.timestamps
    end
    
    add_index :url_shortener_shortened_urls, :full_link, length: 2083
    add_index :url_shortener_shortened_urls, :shortened_link, unique: true
  end
end