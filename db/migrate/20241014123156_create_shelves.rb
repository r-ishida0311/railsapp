class CreateShelves < ActiveRecord::Migration[7.1]
  def change
    create_table :shelves do |t|
      t.references :storage, null: false, foreign_key: true
      t.string :shelf

      t.timestamps
    end
  end
end
