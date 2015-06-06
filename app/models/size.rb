class Size < ActiveRecord::Base

  default_scope { where(published: true) }

  validates :name, presence: true
  validates :icon, numericality: { only_integer: true, less_than_or_equal_to: 6 }
  validates :volume, numericality: { only_integer: true }

end
