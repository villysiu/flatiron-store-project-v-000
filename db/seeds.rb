10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(4),
    price: Faker::Number.number(2)
  )
  Category.create(title: Faker::Commerce.department)
  User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
end
User.create(email: 'admin@admin.com', password: "password", password_confirmation: "password")
counter = 1
Item.all.each do |item|
  item.category_id = Faker::Number.between(1,10)
  item.save
  counter += 1
end
