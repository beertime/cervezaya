ActiveAdmin.register Product do

  permit_params :price, :published, :brand_id, :size_id, :bar_id, :franchise_id

end
