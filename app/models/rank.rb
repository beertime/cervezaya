class Rank < ActiveRecord::Base
  belongs_to :user
  belongs_to :bar

  validates :value, presence: true
  validates :user_id, presence: true
  validates :bar_id, presence: true
end
