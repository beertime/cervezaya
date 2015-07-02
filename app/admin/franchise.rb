ActiveAdmin.register Franchise do

  permit_params :name, :photo, :published, bar_ids: [],
    products_attributes: [ :id, :price, :brand_id, :size_id, :published, :_destroy ]
    # bars_attributes: [ :id, :name ]

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
    f.inputs do
      f.input :name
      f.input :photo
      f.inputs "Bares" do
        current_franchise = Franchise.find(params[:id])
        bars = Bar.where("unaccent(name) ILIKE unaccent('%#{current_franchise[:name]}%')").order('name', 'address')
          .map{|b| ["#{b.name}, #{b.address.split(', ')[0]}, #{b.address.split(', ')[1]}", b.id] }
        f.input :bar_ids, as: :check_boxes, collection: bars, label: "Bar"
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
