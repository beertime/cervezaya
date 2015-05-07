class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :color
      t.string :image
      t.string :alt_image
      t.string :shadow_image
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
