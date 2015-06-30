ActiveAdmin.register Franchise do

  permit_params :name, :photo, :published,
    products_attributes: [ :id, :price, :brand_id, :size_id, :published, :_destroy ],
    bars_attributes: [ :id ]

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :photo do |bar|
      image_tag bar.photo.small
    end
    column :published
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs "Bars" do
      f.has_many :bars, heading: false, allow_destroy: false, new_record: true do |p|
        p.input :id, label: 'Bar', as: :select, collection: Bar.all
      end
    end
    f.inputs "Cervezas" do
      f.has_many :products, heading: false, allow_destroy: true, new_record: true do |p|
        p.input :price
        p.input :brand
        p.input :size
        p.input :published
      end
    end
    f.actions
  end

end
