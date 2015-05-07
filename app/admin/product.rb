ActiveAdmin.register Product do

  permit_params :price, :published, :brand_id, :size_id

end
