class Product < ActiveRecord::Base

  default_scope { order('price ASC') }

  belongs_to :brand
  belongs_to :size
  belongs_to :bar
  belongs_to :franchise

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :bar, allow_destroy: true
  accepts_nested_attributes_for :franchise, allow_destroy: true

  def self.get_cheapest(min_price, max_price)
    products = self.where(published: true).where('price >= ?', min_price || 0)
    if max_price
      products = products.where('price <= ?', max_price)
    end
    products.order(price: :asc).first
  end

end
