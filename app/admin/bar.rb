ActiveAdmin.register Bar do

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
    f.actions
  end

  permit_params :name, :description, :photo, :address, :region,
    :country, :postal, :phone, :rank, :latitude, :longitude, :published, :franchise_id

  active_admin_import

  scope_to do
    Class.new do
      def self.bars
        Bar.unscoped
      end
    end
  end

end
