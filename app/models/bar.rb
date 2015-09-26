class Bar < ActiveRecord::Base

  include Geokit::Geocoders

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
  belongs_to :zone

  has_many :products

  validates :name, presence: true

  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :franchise, allow_destroy: true

  mount_uploader :photo, BarUploader

  # Filters
  def self.filter_by_params(params)

    bars = self

    if params.has_key?(:latitude) and params.has_key?(:longitude)
      origin = [params[:latitude], params[:longitude]]
      bars = self.filter_by_lat_lng(origin, params[:min_distance], params[:max_distance])
    end

    if params.has_key?(:q)
      bars = bars
        .where("unaccent(name) ILIKE unaccent('%#{params[:q]}%')
          OR unaccent(address) ILIKE unaccent('%#{params[:q]}%')")
    end

    if params.has_key?(:icons_ids)
      bars = bars.filter_by_icons(params[:icons_ids])
    end

    if params.has_key?(:brands_ids)
      bars = bars.filter_by_brands(params[:brands_ids])
    end

    if params.has_key?(:sizes_id)
      bars = bars.filter_by_sizes(params[:sizes_id])
    end

    if params.has_key?(:types_ids)
      bars = bars.filter_by_types(params[:types_ids])
    end

    # if params.has_key?(:min_price)
    #   bars = bars.where('products.price >= ?', params[:min_price].to_f)
    # end

    if params.has_key?(:max_price)
      bars = bars.where('products.price <= ?', params[:max_price].to_f)
    end

    # Filter by city
    if params.has_key?(:city)
      bars = bars.where(region: params[:city])
    elsif params.has_key?(:latitude) and params.has_key?(:longitude)
      location = GoogleGeocoder.reverse_geocode([params[:latitude], params[:longitude]].join(','))
      bars = bars.where(region: location.city)
    end

    # Filter by zones
    if params.has_key?(:zones)
      bars = bars.where(zone: params[:zones_ids])
    end

    bars

  end

  # Sort
  def self.sort_by_params(params)
    if params.has_key?(:sort) and params[:sort] == 'price'
      self.select('bars.*, MIN(products.price) AS product_price')
        .joins('LEFT JOIN products ON bars.id = products.bar_id OR bars.franchise_id = products.franchise_id')
        .group('bars.id').order('product_price ASC')
        .within(50, origin: [params[:latitude].to_f, params[:longitude].to_f])
    elsif params.has_key?(:sort) and params[:sort] == 'rank'
      self.joins('LEFT JOIN products ON bars.id = products.bar_id OR bars.franchise_id = products.franchise_id')
      .group('bars.id').where.not(rank: nil).order(rank: :desc)
    elsif params.has_key?(:latitude) and params.has_key?(:longitude)
      self.joins('LEFT JOIN products ON bars.id = products.bar_id OR bars.franchise_id = products.franchise_id')
      .group('bars.id').by_distance(origin: [params[:latitude].to_f, params[:longitude].to_f])
    else
      self.includes(:products)
    end
  end

  def self.filter_by_lat_lng(origin, min_distance, max_distance)
    if min_distance and max_distance
      self.in_range(min_distance..max_distance, origin: origin)
    elsif max_distance and min_distance.blank?
      self.within(max_distance, origin: origin)
    elsif min_distance and max_distance.blank?
      self.beyond(min_distance, origin: origin)
    else
      self
    end
  end

  def self.filter_by_brands(brands_ids)
    self.where({ products: { brand: brands_ids } })
  end

  def self.filter_by_types(types_ids)
    brands_ids = Brand.includes(:brands_types).where(brands_types: { type_id: types_ids }).pluck(:id)
    self.where({ products: { brand: brands_ids } })
  end

  def self.filter_by_sizes(sizes_ids)
    self.where({ products: { size: sizes_ids } })
  end

  def self.filter_by_icons(icons_ids)
    sizes_ids = Size.where(icon: icons_ids).pluck(:id)
    self.where({ products: { size: sizes_ids } })
  end

  def self.update_rank(bar_id, rank)
    bar = self.find(bar_id)
    values = Rank.where(bar_id: bar_id).pluck(:value)
    avg = values.push(rank.to_i).sum.to_f / values.size.to_f
    bar.update_attributes(rank: avg.round)
  end

  def self.types_count(type_id)
    brands_ids = Brand.includes(:brands_types).where(brands_types: { type_id: type_id }).pluck(:id)
    bars = self.includes(:products).where({ products: { brand: brands_ids } })
    bars.count
  end

  def self.brands_count(brand_id)
    bars = self.includes(:products).where({ products: { brand: brand_id } })
    bars.count
  end

  def self.zones_count(zone_id)
    bars = self.where(zone_id: zone_id)
    bars.count
  end

end
