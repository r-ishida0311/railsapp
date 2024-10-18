class Changefdsbkh < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :item_no, foreign_key: true
  end
end
