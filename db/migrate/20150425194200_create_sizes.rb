class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name
      t.integer :icon
      t.integer :volume
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
