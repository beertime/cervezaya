class API::V2::ContactSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :message
  
end
