class AddSongSnippetCol < ActiveRecord::Migration

  def self.up
    add_column :songs, :snippet_url, :string
  end

  def self.down
    remove_column :songs, :snippet_url
  end

end
