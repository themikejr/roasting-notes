class CreateTastings < ActiveRecord::Migration[5.1]
  def change
    create_table :tastings do |t|

      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true
      t.references :origin, foreign_key: true

      t.float :dry_fragrance
      t.float :wet_aroma
      t.float :brightness
      t.float :flavor
      t.float :body
      t.float :finish
      t.float :sweetness
      t.float :clean_cup
      t.float :complexity
      t.float :uniformity

      t.string :nose_notes
      t.string :mouth_notes

      t.timestamps
    end
  end
end
