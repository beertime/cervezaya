class Type < ActiveRecord::Base

  has_and_belongs_to_many :brands

  validates :name, presence: true

end
