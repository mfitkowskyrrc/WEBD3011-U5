require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product|
  category = Category.find_or_create_by(name: category_name)

  Product.create(
    title: row["name"],
    description: row["description"],
    price: row["price"].to_f,
    stock_quantity: row["stock quantity"].to_i,
    category: category
  )
end