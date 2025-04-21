class RemoveCoverImageFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :cover_image, :string
  end
end
