class RenameEntrepreinersToIdeas < ActiveRecord::Migration
  def change
  	rename_table :entrepreneurs, :ideas
  end
end
