class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item_no
  # ... other code ...
  belongs_to :item_no, optional: true  
end
