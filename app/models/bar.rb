class Bar < ActiveRecord::Base

  acts_as_mappable :default_units => :kms,
    :default_formula => :sphere,
    :distance_field_name => :distance,
    :lat_column_name => :latitude,
    :lng_column_name => :longitude

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

  def self.filter_by_lat_lng(origin, min_distance, max_distance)
    if min_distance and max_distance
      self.in_range(min_distance..max_distance, origin: origin).by_distance(origin: origin)
    else
      self.within(max_distance || 25, origin: origin).by_distance(origin: origin)
    end
  end

  def self.sort_by_rank()
    self.where.not(rank: nil).order(rank: :desc)
  end

  def self.sort_by_price()
    self.includes(:products).where.not('products.price': nil)
      .order('products.price ASC')
  end

  def self.update_rank(bar_id, rank)
    bar = self.find(bar_id)
    values = Rank.where(bar_id: bar_id).pluck(:value)
    avg = values.push(rank.to_i).sum.to_f / values.size.to_f
    bar.update_attributes(rank: avg.round)
  end

  def self.set_user(user_id)
    @user = user_id ? User.find_by_id(user_id) : nil
  end

  def self.get_user_rank(bar_id)
    if @user
      ranks = Rank.where(bar_id: bar_id).where(user_id: @user.id).pluck(:value)
      size = ranks.count
      size > 0 ? ranks.sum / size : 0
    else
      0
    end
  end

  def self.get_user_rank_id(bar_id)
    if @user
      rank = Rank.where(bar_id: bar_id).where(user_id: @user.id).first
      rank ? rank.id : nil
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

  def self.filter_by_brands(brands_ids)
    self.joins(:products).where({ products: { brand: brands_ids } })
  end

  def self.filter_by_sizes(sizes_ids)
    self.joins(:products).where({ products: { size: sizes_ids } })
  end

  def self.filter_by_icons(icons)
    sizes_ids = Size.where(id: icons).pluck(:id)
    self.joins(:products).where({ products: { size: sizes_ids } })
  end

  def self.where_min_max_price(min_price, max_price)
    bars = self.joins(:products)
    if min_price
      bars = bars.where('products.price >= ?', min_price.to_f)
    end
    if max_price
      bars = bars.where('products.price <= ?', max_price.to_f)
    end
    bars.distinct
  end

end
