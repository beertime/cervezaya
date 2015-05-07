class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :price
      t.boolean :published, default: false

      t.belongs_to :brand, index:true
      t.belongs_to :size, index:true
      t.belongs_to :franchise, index:true
      t.belongs_to :bar, index:true

      t.timestamps null: false
    end
  end
end
