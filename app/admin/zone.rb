ActiveAdmin.register Zone do

  permit_params :name, :geometry, :city, :country, :image, :published

  active_admin_import

end
