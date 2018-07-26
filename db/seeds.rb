# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  worker = Worker.create(email: "sample#{i}@ex.com", password: "password")
  shop = Shop.create(name: "ダミー店#{i}")
  WorkerShop.create(worker: worker, shop: shop)

  staff = Staff.create(email: "staff#{i}@ex.com", password: "password", shop: shop)
end
