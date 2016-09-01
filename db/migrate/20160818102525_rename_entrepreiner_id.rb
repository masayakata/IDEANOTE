class RenameEntrepreinerId < ActiveRecord::Migration
  def change
  	rename_column :comments, :entrepreneur_id, :idea_id
  end
end
