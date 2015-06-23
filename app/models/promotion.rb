class Promotion < ActiveRecord::Base

  default_scope { order('end_date') }

  belongs_to :bar

  validates :title, presence: true

  mount_uploader :image, PromotionUploader

  def self.current_iteration(promotion)
    if promotion.recurrent
      days_availables = [
        promotion.sunday ? 0 : nil,
        promotion.monday ? 1 : nil,
        promotion.tuesday ? 2 : nil,
        promotion.wednesday ? 3 : nil,
        promotion.thursday ? 4 : nil,
        promotion.friday ? 5 : nil,
        promotion.saturday ? 6 : nil
      ]
      date_range = Date.today..promotion.end_date
      result = date_range.select { |d| days_availables.include?(d.wday) }.first

      [
        self.format_date(result, promotion.start_hour),
        self.format_date(result, promotion.end_hour)
      ]
    else
      [
        self.format_date(promotion.start_date, promotion.start_hour),
        self.format_date(promotion.end_date, promotion.end_hour)
      ]
    end
  end

  def self.format_date(date, hour)
    "#{date} #{hour.strftime("%H:%M")}"
  end

end
