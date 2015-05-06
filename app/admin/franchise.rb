ActiveAdmin.register Franchise do

  permit_params :name, :photo, :published

  active_admin_import

end
