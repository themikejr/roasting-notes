class Batch < ActiveRecord::Base
  has_many :tastings
  belongs_to :origin
  attachment :artisan_image, type: :image
end
