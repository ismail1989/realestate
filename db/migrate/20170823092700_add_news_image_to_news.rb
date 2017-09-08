class AddNewsImageToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :news_image, :string
  end
end
