class Item < ApplicationRecord
  belongs_to :category
  belongs_to :equipment
  belongs_to :storage
  belongs_to :shelf
  belongs_to :affiliation
  has_many :item_nos, dependent: :destroy
end
