class Recent < ActiveRecord::Base
  default_scope { order('updated_at DESC') }

  belongs_to :user
  belongs_to :bar

  validates :bar_id, presence: true
  validates :user_id, presence: true
end
