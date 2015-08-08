class User < ActiveRecord::Base

  has_many :favorites
  has_many :bars, through: :favorites
  has_many :recents
  has_many :bars, through: :recents
  has_many :ranks
  has_many :bars, through: :ranks
  has_many :opinions
  has_many :bars, through: :opinions
  has_many :contacts

  mount_uploader :custom_avatar, AvatarUploader

  validates :email, presence: true, uniqueness: true
  validates :username,
    length: { minimum: 4, message: "\"username\" must be longer than 4 characters"},
    uniqueness: { case_sensitive: false },
    allow_blank: true,
    format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :gender, format: { with: /male|female|other/i, message: "Gender must be \"male\", \"female\" or \"other\"" },
    allow_blank: true

end
