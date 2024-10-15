class Storage < ApplicationRecord
  validates :storage, presence: true, uniqueness: true
  has_many :shelves, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "storage", "updated_at"]
  end
end
