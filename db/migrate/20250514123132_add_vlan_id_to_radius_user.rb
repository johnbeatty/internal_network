class AddVlanIdToRadiusUser < ActiveRecord::Migration[8.0]
  def change
    add_column :radius_users, :tunnel_private_group_id, :integer, default: 1
    add_column :radius_users, :tunnel_medium_type, :integer, default: 1
    add_column :radius_users, :tunnel_type, :integer, default: 1
  end
end
