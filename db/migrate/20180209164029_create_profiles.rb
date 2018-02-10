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

      t.float :dry_time
      t.float :dry_time_percentage
      t.float :malliard_time
      t.float :malliard_time_percentage
      t.float :development_time
      t.float :development_time_percentage

      t.float :charge_temp
      t.float :drop_temp

      t.string  :artisan_json

      t.string  :roast_length_pretty

      t.timestamps
    end
  end
end
