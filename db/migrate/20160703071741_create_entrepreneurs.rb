class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.string :title
      t.text :text
      t.string :image

      t.timestamps null: false
    end
  end
end
