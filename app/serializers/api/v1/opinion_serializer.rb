class API::V1::OpinionSerializer < ActiveModel::Serializer

  attributes :id, :comment, :time_value, :time_unit
  has_one :user

  def time_value
    time = Time.now.to_i - object.created_at.to_i
    object.get_time_value(time)
  end

  def time_unit
    time = Time.now.to_i - object.created_at.to_i
    object.get_time_unit(time)
  end

end
