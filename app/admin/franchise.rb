ActiveAdmin.register Franchise do

  permit_params :name, :photo, :published

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
    f.inputs 'Cervezas' do
      # f.has_many :products, heading: 'Cerveza', allow_destroy: true, new_record: true
    end
    f.actions
  end

  scope_to do
    Class.new do
      def self.franchises
        Franchise.unscoped
      end
    end
  end

end
