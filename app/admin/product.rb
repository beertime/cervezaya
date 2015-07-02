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

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :brand
      f.input :size
      f.input :bar, label: 'Bar', as: :select,
        collection: Bar.all.order('name', 'address').map{|b| ["#{b.name}, #{b.address.split(', ')[0]}, #{b.address.split(', ')[1]}", b.id]}
      f.input :franchise
      f.input :price
      f.input :published
    end
    f.actions
  end

end
