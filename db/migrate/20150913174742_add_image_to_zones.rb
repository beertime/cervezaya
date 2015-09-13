class AddImageToZones < ActiveRecord::Migration
  def change
    add_column :zones, :image, :string
  end
end
