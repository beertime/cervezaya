class User < ActiveRecord::Base

  has_many :favorites
  has_many :bars, through: :favorites
  has_many :recents
  has_many :bars, through: :recents
  has_many :ranks
  has_many :bars, through: :ranks
  has_many :opinions
  has_many :bars, through: :opinions

  mount_uploader :custom_avatar, AvatarUploader

  validates :email, presence: true

end
