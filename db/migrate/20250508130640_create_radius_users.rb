class CreateRadiusUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :radius_users do |t|
      t.string :username
      t.string :password
      t.string :notes

      t.timestamps
    end
  end
end
