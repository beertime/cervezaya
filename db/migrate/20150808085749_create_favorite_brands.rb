class CreateFavoriteBrands < ActiveRecord::Migration
  def change
    create_table :favorite_brands do |t|
      t.belongs_to :brand, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
