ActiveAdmin.register Type do
  
  permit_params :name, :published
  active_admin_import

end
