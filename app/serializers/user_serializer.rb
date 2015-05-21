class UserSerializer < ActiveModel::Serializer

  attributes :id, :push_uid, :facebook_uid, :google_uid, :username, :email,
    :publicname, :avatar, :custom_avatar, :gender, :birth, :city, :country

  def custom_avatar
    object.custom_avatar.url.to_s.split('/').last
  end

end
