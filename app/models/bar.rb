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

end
