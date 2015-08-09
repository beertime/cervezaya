class AddImageColumnToTypes < ActiveRecord::Migration
  def change
    add_column :types, :image, :string
  end
end
