class Favorite < ActiveRecord::Base

  default_scope { order('updated_at DESC') }

  belongs_to :user
  belongs_to :bar

  def self.get_by_user_and_bar(user_id, bar_id)
    self.find_by(user_id: user_id, bar_id: bar_id)
  end

end
