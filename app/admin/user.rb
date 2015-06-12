ActiveAdmin.register User do

  permit_params :push_uid, :facebook_uid, :google_uid, :username,
    :publicname, :email, :avatar, :country, :city, :gender, :birth, :active

  scope_to do
    Class.new do
      def self.users
        User.unscoped
      end
    end
  end

end
