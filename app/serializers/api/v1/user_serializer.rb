class API::V1::UserSerializer < ActiveModel::Serializer

  attributes :id, :push_uid, :facebook_uid, :google_uid, :username, :email,
    :publicname, :avatar, :custom_avatar, :gender, :birth, :city, :country

  def custom_avatar
    object.custom_avatar.small.url
  end

end
