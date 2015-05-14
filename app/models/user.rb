class User < ActiveRecord::Base

  has_many :favorites
  has_many :bars, through: :favorites
  has_many :recents
  has_many :bars, through: :recents
  has_many :ranks
  has_many :bars, through: :ranks
  has_many :opinions
  has_many :bars, through: :opinions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

end
