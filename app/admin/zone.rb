ActiveAdmin.register Zone do

  permit_params :name, :geometry, :city, :country

  active_admin_import

end
