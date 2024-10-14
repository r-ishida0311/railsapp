class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.references :category, null: false, foreign_key: true
      t.string :equipment

      t.timestamps
    end
  end
end
