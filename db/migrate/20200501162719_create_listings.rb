class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :available_beds
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.belongs_to :city
      t.references :lodger, index: true     

      t.timestamps
    end
  end
end
