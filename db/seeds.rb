require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product|
  category = Category.find_or_create_by(name: product["category"])

  Product.create(
    title: product["name"],
    price: product["price"],
    description: product["description"],
    stock_quantity: product["stock quantity"],
    category: category
  )
end