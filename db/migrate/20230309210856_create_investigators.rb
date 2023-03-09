class CreateInvestigators < ActiveRecord::Migration[7.0]
  def change
    create_table :investigators do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.decimal :fee
      t.integer :rating

      t.timestamps
    end
  end
end
