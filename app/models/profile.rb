class Profile < ApplicationRecord
  has_many :tastings
  belongs_to :origin
end
