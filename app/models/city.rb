class City < ActiveRecord::Base
  default_scope { order('lower(unaccent(name)) ASC') }
end
