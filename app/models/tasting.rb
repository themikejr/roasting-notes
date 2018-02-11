class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :batch, optional: true
  belongs_to :origin
end
