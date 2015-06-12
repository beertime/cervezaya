ActiveAdmin.register Type do
  
  permit_params :name, :published
  active_admin_import

  scope_to do
    Class.new do
      def self.types
        Type.unscoped
      end
    end
  end

end
