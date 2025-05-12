class CreateRadiusPostAuthorizations < ActiveRecord::Migration[8.0]
  def change
    create_table :radius_post_authorizations do |t|
      t.string :calledStationId
      t.string :callingStationId
      t.string :accountingSessionId
      t.string :accountingMultiSessionId
      t.string :username
      t.integer :authorization_status, default: 0
      t.references :radius_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
