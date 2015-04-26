ActiveAdmin.register Bar do

  permit_params :name, :description, :photo, :address, :city, :region,
    :country, :postal, :phone, :rank, :published

end
