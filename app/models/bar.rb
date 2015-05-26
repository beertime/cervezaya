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

  def self.sort_by_rank()
    self.where.not(rank: nil).order(rank: :desc)
  end

  def self.sort_by_price()
    self.joins(:products)
      .order('products.price ASC')
      .where.not('products.price': nil)
      .where(franchise: nil)
  end

  def self.update_rank(bar_id, rank)
    bar = self.find(bar_id)
    result = ((bar.rank || 0) + rank.to_i) / 2
    bar.update_attributes(rank: result)
  end

  def self.set_user(user_id)
    @user = user_id ? User.find_by_id(user_id) : nil
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

  def self.get_user_favorite(bar_id)
    if @user
      Favorite.where(bar_id: bar_id).where(user_id: @user.id).count > 0
    else
      false
    end
  end

  def self.get_user_favorite_id(bar_id)
    if @user
      favorite = Favorite.where(bar_id: bar_id).where(user_id: @user.id)
      favorite.count > 0 ? favorite[0].id : nil
    else
      nil
    end
  end

  def self.fiter_by_brands(brand_ids)
    self
  end

end
