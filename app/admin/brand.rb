ActiveAdmin.register Brand do

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs "Tipos" do
      f.input :type_ids, as: :check_boxes, collection: Type.all, label: "Tipo"
    end
    f.actions
  end

  permit_params :name, :color, :image, :alt_image, :shadow_image, :published, type_ids: []

  active_admin_import

end
