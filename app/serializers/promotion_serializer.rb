class PromotionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_small, :image_medium, :image_large, :start_date, :end_date, :recurrent
  has_one :bar

  def start_date
    "#{object.start_date} #{object.start_hour.strftime("%H:%M")}"
  end

  def end_date
    "#{object.end_date} #{object.end_hour.strftime("%H:%M")}"
  end

  def image_small
    "#{object.image.small}"
  end

  def image_medium
    "#{object.image.medium}"
  end

  def image_large
    "#{object.image.large}"
  end

end
