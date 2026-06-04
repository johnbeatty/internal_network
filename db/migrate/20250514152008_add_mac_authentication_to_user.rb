class AddMacAuthenticationToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :radius_users, :mac_authentication, :boolean, default: false
  end
end
