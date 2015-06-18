ActiveAdmin.register User do

  permit_params :push_uid, :facebook_uid, :google_uid, :username,
    :publicname, :email, :avatar, :country, :city, :gender, :birth, :active

  index do
    selectable_column
    id_column
    column :email
    column :usename
    column :avatar do |product|
      image_tag product.avatar.small
    end
    column :gender
    column :city
    column :published
    column :updated_at
    actions
  end

  scope_to do
    Class.new do
      def self.users
        User.unscoped
      end
    end
  end

end
