class Origin < ApplicationRecord
  has_many :tastings
  has_many :profiles
end
