class API::V1::PromotionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image,
    :start_date, :end_date, :recurrent, :current_iteration

  has_one :bar, serializer: BarDetailSerializer

  def start_date
    Promotion.format_date(object.start_date, object.start_hour)
  end

  def end_date
    Promotion.format_date(object.end_date, object.end_hour)
  end

  def image
    object.image_identifier
  end

  def current_iteration
    Promotion.current_iteration(object, serialization_options[:date])
  end

end
