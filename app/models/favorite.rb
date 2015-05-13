class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :bar

  validates :user_id, presence: true
  validates :bar_id, presence: true
end
