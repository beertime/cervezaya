class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :address
      t.string :city
      t.string :region
      t.string :country
      t.string :postal
      t.string :phone
      t.integer :rank
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
