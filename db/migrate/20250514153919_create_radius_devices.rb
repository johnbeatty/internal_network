class CreateRadiusDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :radius_devices do |t|
      t.references :radius_user, null: false, foreign_key: true
      t.string :calledStationId
      t.boolean :allowed, default: true

      t.timestamps
    end
    add_index :radius_devices, :calledStationId
  end
end
