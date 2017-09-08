class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :tag_list
      t.string :keywords
      t.string :meta_description
      t.string :source
      t.text :body

      t.timestamps
    end
  end
end
