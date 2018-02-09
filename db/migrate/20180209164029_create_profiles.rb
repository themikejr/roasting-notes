class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :coffee_name
      t.string :origin_country
      t.string :origin_farm
      t.string :processing_type

      t.integer :batch_number

      t.integer :roast_length
      t.integer :turning_point
      t.integer :dry_end
      t.integer :first_crack_start
      t.integer :first_crack_end
      t.integer :second_crack_start
      t.integer :second_crack_end

      t.timestamps
    end
  end
end
