class UpdateItemTables < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :items, :affiliations
    remove_index :items, :affiliation_id
    remove_reference :items, :affiliation
end
end