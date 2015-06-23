ActiveAdmin.register Product do

  permit_params :price, :published, :brand_id, :size_id, :bar_id, :franchise_id

  index do
    selectable_column
    id_column
    column :price
    column :brand
    column :size
    column :bar
    column :franchise
    column :published
    column :updated_at
    actions
  end

end
