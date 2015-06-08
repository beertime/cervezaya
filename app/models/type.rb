class Type < ActiveRecord::Base

  default_scope { where(published: true) }

  has_and_belongs_to_many :brands

  validates :name, presence: true

end
