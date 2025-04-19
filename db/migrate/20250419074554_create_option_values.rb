class CreateOptionValues < ActiveRecord::Migration[8.0]
  def change
    create_table :option_values do |t|
      t.string :value
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
