ActiveAdmin.register Bar do

  permit_params :name, :description, :photo, :address, :region,
    :country, :postal, :phone, :rank, :latitude, :longitude, :published, :franchise_id

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :photo
    column :region
    column :address
    column :phone
    column :email
    column :rank
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs "Products" do
      f.has_many :products, heading: false, allow_destroy: true do |p|
        p.input :price
        p.input :brand
        p.input :size
      end
    end
    f.actions
  end

  scope_to do
    Class.new do
      def self.bars
        Bar.unscoped
      end
    end
  end

end
