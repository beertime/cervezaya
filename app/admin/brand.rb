ActiveAdmin.register Brand do

  permit_params :name, :color, :image, :alt_image, :shadow_image, :published

end
