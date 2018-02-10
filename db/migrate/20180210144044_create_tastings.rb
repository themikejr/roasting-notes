class CreateTastings < ActiveRecord::Migration[5.1]
  def change
    create_table :tastings do |t|

      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true
      t.references :origin, foreign_key: true

      t.float "dry_fragrance"
      t.float "wet_aroma"
      t.float "flavor"
      t.float "aftertaste"
      t.float "acidity"
      t.float "body"
      t.float "balance"
      t.float "sweetness"
      t.float "uniformity"
      t.float "cleaniness"

      t.string :nose_notes
      t.string :mouth_notes

      t.timestamps
    end
  end
end
