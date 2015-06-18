ActiveAdmin.register Contact do

  permit_params :message, :user_id

  scope_to do
    Class.new do
      def self.contacts
        Contact.unscoped
      end
    end
  end

end
