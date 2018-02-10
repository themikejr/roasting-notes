class CreateOrigins < ActiveRecord::Migration[5.1]
  def change
    create_table :origins do |t|
      t.string :name
      t.string :region
      t.string :country
      t.string :processing_type

      t.integer :elevation

      t.timestamps
    end
  end
end
