class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_email

      t.timestamps
    end
  end
end
