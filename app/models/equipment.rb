class Equipment < ApplicationRecord
  validates :equipment, presence: true, uniqueness: true
  belongs_to :category
end
