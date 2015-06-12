ActiveAdmin.register Franchise do

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs 'Cervezas' do
      # f.has_many :products, heading: 'Cerveza', allow_destroy: true, new_record: true
    end
    f.actions
  end

  permit_params :name, :photo, :published

  active_admin_import

  scope_to do
    Class.new do
      def self.franchises
        Franchise.unscoped
      end
    end
  end

end
