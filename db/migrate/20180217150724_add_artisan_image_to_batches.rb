class AddArtisanImageToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :artisan_image_id, :string
    add_column :batches, :artisan_image_filename, :string
    add_column :batches, :artisan_image_content_size, :string
    add_column :batches, :artisan_image_content_type, :string

  end
end
