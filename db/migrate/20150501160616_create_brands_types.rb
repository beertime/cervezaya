class CreateBrandsTypes < ActiveRecord::Migration
  def change
    create_table :brands_types, id: false do |t|
      t.references :brand, index: true
      t.references :type, index: true
    end
  end
end
