ActiveAdmin.register Bar do

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end

  permit_params :name, :description, :photo, :address, :region,
    :country, :postal, :phone, :rank, :latitude, :longitude, :published, :franchise_id

  active_admin_import

end
