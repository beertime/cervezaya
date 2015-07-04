ActiveAdmin.register User do

  permit_params :push_uid, :facebook_uid, :google_uid, :username,
    :publicname, :email, :avatar, :country, :city, :gender, :birth, :active, :custom_avatar

  index do
    selectable_column
    id_column
    column :email
    column :usename
    column :avatar do |user|
      image_tag user.avatar
    end
    column :gender
    column :city
    column :published
    column :updated_at
    actions
  end

end
