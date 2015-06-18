ActiveAdmin.register Type do

  permit_params :name, :published

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :published
    column :updated_at
    actions
  end

  scope_to do
    Class.new do
      def self.types
        Type.unscoped
      end
    end
  end

end
