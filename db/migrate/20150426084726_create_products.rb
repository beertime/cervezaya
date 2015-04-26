class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :price
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
