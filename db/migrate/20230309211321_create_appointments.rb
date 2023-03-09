class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.references :investigator_id, null: false, foreign_key: { to_table: :investigators }
      t.datetime :date
      t.string :city

      t.timestamps
    end
  end
end
