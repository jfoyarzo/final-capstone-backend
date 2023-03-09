class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :investigator, null: false, foreign_key: true
      t.datetime :date
      t.string :city

      t.timestamps
    end
  end
end
