class AddImagesUrlsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :images_urls, :text, array: true, default: []
  end
end
