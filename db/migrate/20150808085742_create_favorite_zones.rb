class CreateFavoriteZones < ActiveRecord::Migration
  def change
    create_table :favorite_zones do |t|
      t.belongs_to :zone, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
