ActiveAdmin.register Size do
  
  permit_params :name, :icon, :volume, :published
  active_admin_import

  scope_to do
    Class.new do
      def self.sizes
        Size.unscoped
      end
    end
  end

end
