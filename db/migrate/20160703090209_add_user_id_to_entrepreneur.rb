class AddUserIdToEntrepreneur < ActiveRecord::Migration
  def change
    add_reference :entrepreneurs, :user_, index: true, foreign_key: true
  end
end
