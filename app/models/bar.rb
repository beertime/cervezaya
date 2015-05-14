class Bar < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites
  has_many :recents
  has_many :users, through: :recents
  has_many :ranks
  has_many :users, through: :ranks
  has_many :opinions
  has_many :users, through: :opinions

  belongs_to :franchise
  has_many :products

  validates :name, presence: true

  mount_uploader :photo, BarUploader

  geocoded_by :address, :latitude  => :latitude, :longitude => :longitude

  paginates_per 25

  def self.update_rank(bar_id, rank)
    bar = self.find(bar_id)
    result = (bar.rank + rank.to_i) / 2
    bar.update_attributes(rank: result)
  end

  def self.set_user(user_id)
    if user_id
      @user = User.find(user_id)
    end
  end

  def self.get_user_favorite(bar_id)
    if @user
      Favorite.where(bar_id: bar_id).where(user_id: @user.id).count > 0
    else
      false
    end
  end

  def self.get_user_rank(bar_id)
    if @user
      ranks = Rank.where(bar_id: bar_id).where(user_id: @user.id).pluck(:value)
      size = ranks.count
      size > 0 ? ranks.sum / size : nil
    else
      nil
    end
  end

end
