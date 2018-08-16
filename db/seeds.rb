# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  worker = Worker.create(email: "worker#{i}@ex.com", name: Gimei.female.first.kanji, password: "password")
  shop = Shop.create(name: "ダミー店#{i}")
  WorkerShop.create(worker: worker, shop: shop)

  staff = Staff.create(email: "staff#{i}@ex.com", password: "password", shop: shop)
end

# for shop 0
shop = Shop.first
worker = Worker.create(email: "sample@ex.com", name: Gimei.female.first.kanji, password: "password")
worker1 = Worker.create(email: "sample1@ex.com", name: Gimei.female.first.kanji, password: "password")
WorkerShop.create(worker: worker, shop: shop)
WorkerShop.create(worker: worker1, shop: shop)

now = Time.zone.now
5.times do |i|
  now = now + 1.day
  Schedule.create(start_at: now, end_at: now.end_of_day, worker: worker)
  Schedule.create(start_at: now, end_at: now.end_of_day, worker: worker1)
end
