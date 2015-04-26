class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :country
      t.string :region
      t.string :city
      t.string :address
      t.string :postal
      t.string :phone
      t.integer :rank
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
