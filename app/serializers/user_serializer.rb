class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :email, :publicname, :name, :avatar, :gender, :birth, :city, :country

  def name
    "#{object.firstname} #{object.lastname}"
  end

  def avatar
    object.avatar.small.try(:image)
  end
end
