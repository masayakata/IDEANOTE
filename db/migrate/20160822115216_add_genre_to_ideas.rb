class AddGenreToIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :genre, :string
  end
end
