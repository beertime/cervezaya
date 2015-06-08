class Rank < ActiveRecord::Base

  belongs_to :user
  belongs_to :bar

  validates :value, presence: true,
    numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }

  def self.get_by_user_and_bar(user_id, bar_id)
    self.find_by(user_id: user_id, bar_id: bar_id)
  end

end
