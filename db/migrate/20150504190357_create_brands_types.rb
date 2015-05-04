class CreateBrandsTypes < ActiveRecord::Migration
  def change
    create_table :brands_types do |t|
      t.references :type, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
