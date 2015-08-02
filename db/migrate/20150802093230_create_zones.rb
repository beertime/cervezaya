class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.string :geometry
      t.string :city
      t.string :country, default: 'ES'
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
