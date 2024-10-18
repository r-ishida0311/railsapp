class ChangeCokosdfpb < ActiveRecord::Migration[7.1]

    def change
      remove_foreign_key :reservations, :items
      remove_index :reservations, :item_id
      remove_reference :reservations, :item
    end
end
