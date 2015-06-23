ActiveAdmin.register Brand do

  permit_params :name, :color, :image, :alt_image, :shadow_image, :published, type_ids: []

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :color do |product|
      span product.color, style: "color: #{product.color}"
    end
    column :image do |product|
      image_tag product.image.small
    end
    column :alt_image do |product|
      image_tag product.alt_image.small, style: "background-color: #{product.color}"
    end
    column :shadow_image do |product|
      image_tag product.shadow_image.small
    end
    column :published
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :color, as: :string
      f.input :image
      f.input :alt_image
      f.input :shadow_image
      f.input :published
    end
    f.inputs "Tipos" do
      f.input :type_ids, as: :check_boxes, collection: Type.all, label: "Tipo"
    end
    f.actions
  end

end
