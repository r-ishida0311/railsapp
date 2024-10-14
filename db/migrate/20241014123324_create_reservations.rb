class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :pgm
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
