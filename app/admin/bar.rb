ActiveAdmin.register Bar do

  permit_params :name, :description, :photo, :address, :region,
    :country, :postal, :phone, :rank, :latitude, :longitude, :published, :franchise_id,
    products_attributes: [ :id, :price, :brand_id, :size_id, :published, :_destroy ]

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :photo do |bar|
      image_tag bar.photo.small
    end
    column :address
    column :rank
    column :published
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs
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
