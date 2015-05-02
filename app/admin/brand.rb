ActiveAdmin.register Brand do

  permit_params :name, :color, :image, :alt_image, :shadow_image, :published

  form do |f|
    f.inputs
    # f.inputs "Tipos" do
    #   f.input :types, as: :check_boxes, collection: Type.all
    # end
    f.actions
  end

end
