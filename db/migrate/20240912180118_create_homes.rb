class CreateHomes < ActiveRecord::Migration[7.1]
  def change
    create_table :homes do |t|
      t.string :description
      t.integer :year_built
      t.integer :sqaure_feet
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :floors
      t.string :availability
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
