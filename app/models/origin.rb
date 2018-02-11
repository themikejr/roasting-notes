class Origin < ApplicationRecord
  has_many :tastings
  has_many :batches
end
