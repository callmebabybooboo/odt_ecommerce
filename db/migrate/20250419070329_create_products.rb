class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :base_price
      t.string :status
      t.string :cover_image

      t.timestamps
    end
  end
end
