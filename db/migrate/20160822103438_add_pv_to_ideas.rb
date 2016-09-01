class AddPvToIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :pv, :integer, default: 0
  end
end
