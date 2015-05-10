class PromotionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :start_date, :end_date, :recurrent
  has_one :bar

  def start_date
    "#{object.start_date} #{object.start_hour.strftime("%H:%M")}"
  end

  def end_date
    "#{object.end_date} #{object.end_hour.strftime("%H:%M")}"
  end
end
