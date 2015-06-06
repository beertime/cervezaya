class Recent < ActiveRecord::Base
  default_scope { order('updated_at DESC') }
  
  belongs_to :user
  belongs_to :bar
end
