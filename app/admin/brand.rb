ActiveAdmin.register Brand do

  form(:html => { :multipart => true }) do |f|

    f.semantic_errors

    f.inputs "Invoice" do
      f.input :name
      f.input :color
      f.input :image
      f.input :alt_image
      f.input :shadow_image
      f.has_many :types, allow_destroy: false, new_record: true do |t|
      #   t.input :name, as: :select, collection: Type.all
        t.inputs
      end
      f.input :published
    end

  #   # f.inputs do
  #   #   f.has_many :types, allow_destroy: false, new_record: true do |t|
  #   #     t.input :name
  #   #     t.input :published
  #   #   end
  #   # end

    f.actions

  end

  permit_params :name, :image, :alt_image, :shadow_image, :published, types: []

end
