class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.string :blog_image
      t.string :body
      t.string :tag_list
      t.string :share

      t.timestamps
    end
  end
end
