class AddWeightToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :start_weight, :integer
    add_column :profiles, :end_weight, :integer
  end
end
