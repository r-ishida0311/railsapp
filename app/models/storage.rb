class Storage < ApplicationRecord
  validates :storage, presence: true, uniqueness: true
  has_many :shelves
end
