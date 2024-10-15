class Shelf < ApplicationRecord
  validates :shelf, presence: true, uniqueness: { scope: :storage_id }
  belongs_to :storage
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "shelf", "updated_at"]
  end
end

