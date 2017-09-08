class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :country
      t.string :province
      t.string :city
      t.string :address
      t.string :holding_type
      t.string :project_name
      t.string :project_code
      t.string :property_name
      t.string :property_code
      t.string :main_photo
      t.string :cover_photo
      t.string :gallery_photos
      t.string :floor_plan_photos
      t.string :city_location_photo
      t.string :description
      t.string :price
      t.string :facilities
      t.boolean :featured

      t.timestamps
    end
  end
end
