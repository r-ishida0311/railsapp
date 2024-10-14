class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item
      t.references :category, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.references :storage, null: false, foreign_key: true
      t.references :shelf, null: false, foreign_key: true
      t.references :affiliation, null: false, foreign_key: true
      t.integer :rental_fee
      t.integer :pre_rental_fee
      t.string :serial
      t.integer :status
      t.text :memo

      t.timestamps
    end
  end
end
