class AddAuthenticationTokenToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :authentication_token, :string
    add_index :admin_users, :authentication_token
  end
end
