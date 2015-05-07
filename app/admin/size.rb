ActiveAdmin.register Size do
  
  permit_params :name, :icon, :volume, :published
  active_admin_import

end
