class UserSerializer < ActiveModel::Serializer

  attributes :id, :push_uid, :facebook_uid, :google_uid, :email, :publicname, :avatar, :gender, :birth, :city, :country

  def avatar
    object.avatar.small.try(:image)
  end

end
