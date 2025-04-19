class CreateVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :variants do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
