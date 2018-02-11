class RenameProfilesToBatches < ActiveRecord::Migration[5.1]
  def change
    rename_table :profiles, :batches
  end
end
