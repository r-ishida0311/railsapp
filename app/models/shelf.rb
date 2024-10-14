class Shelf < ApplicationRecord
  validates :shelf, presence: true, uniqueness: { scope: :storage_id }
  belongs_to :storage
end

