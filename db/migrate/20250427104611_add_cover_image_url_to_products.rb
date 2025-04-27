class AddCoverImageUrlToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :cover_image_url, :string
  end
end
