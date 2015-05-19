class ChangeTypeColumnPrice < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2, null: false, default: 0
  end
end
