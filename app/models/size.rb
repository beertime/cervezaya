class Size < ActiveRecord::Base

  validates :name, presence: true
  validates :icon, numericality: { only_integer: true, less_than_or_equal_to: 6 }
  validates :volume, numericality: { only_integer: true }

end
