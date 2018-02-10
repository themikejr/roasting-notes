class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :profile, optional: true
  belongs_to :origin
end
