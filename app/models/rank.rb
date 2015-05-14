class Rank < ActiveRecord::Base
  belongs_to :user
  belongs_to :bar

  validates :value, presence: true,
    numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }
end
