# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


10.times do
  Item.create!(
    item: "item_#{rand(1000)}",
    category_id: Category.all.sample.id,
    equipment_id: Equipment.all.sample.id,
    storage_id: Storage.all.sample&.id, # 空の値を許可
    shelf_id: Shelf.all.sample&.id, # 空の値を許可
    affiliation_id: Affiliation.all.sample.id,
    rental_fee: rand(100..1000),
    pre_rental_fee: rand(50..500),
    serial: "serial_#{rand(1000)}",
    status: rand(0..2),
    memo: "memo_#{rand(1000)}"
  )
end
