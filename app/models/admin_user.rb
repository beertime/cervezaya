class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # You likely have this before callback set up for the token.
  before_save :ensure_authentication_token

  def ensure_authentication_token
    if defined?(self.authentication_token) and authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless AdminUser.where(authentication_token: token).first
    end
  end
end
