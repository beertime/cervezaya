ActiveAdmin.register User do

  permit_params :push_uid, :facebook_uid, :google_uid, :username,
    :publicname, :email, :avatar, :country, :city, :gender, :birth, :active

end
