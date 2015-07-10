class API::V1::ContactSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :message
end
