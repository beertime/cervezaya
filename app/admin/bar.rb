ActiveAdmin.register Bar do

  permit_params :name, :description, :photo, :address, :region,
    :country, :postal, :phone, :rank, :latitude, :longitude, :published, :franchise_id

  active_admin_import

end
