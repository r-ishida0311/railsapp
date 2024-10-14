class CreateStorages < ActiveRecord::Migration[7.1]
  def change
    create_table :storages do |t|
      t.string :storage

      t.timestamps
    end
  end
end
