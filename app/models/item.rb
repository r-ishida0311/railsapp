class Item < ApplicationRecord
  belongs_to :category
  belongs_to :equipment
  belongs_to :storage
  belongs_to :shelf
  belongs_to :affiliation
  validates :item, presence: true, uniqueness: true
end
