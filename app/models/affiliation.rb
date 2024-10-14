class Affiliation < ApplicationRecord
  validates :Affiliation, presence: true, uniqueness: true
end
