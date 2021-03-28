# Item
Item.destroy_all
Item1 = Item.create({:name=>"tomato", :price => 1,:quantity => 10,:image => "/images/gallery-img-02.jpg"})
Item2 = Item.create({:name=>"milk", :price => 3,:quantity => 10,:image => "/images/gallery-img-02.jpg"})
Item3 = Item.create({:name=>"bread", :price => 5,:quantity => 10,:image => "/images/gallery-img-02.jpg"})
Item4 = Item.create({:name=>"bacon", :price => 10,:quantity => 10,:image => "/images/gallery-img-02.jpg"})
Item5 = Item.create({:name=>"cheese", :price => 32,:quantity => 10,:image => "/images/gallery-img-02.jpg"})

puts "Total number of Items: #{Item.all.count}"
puts "Item names: #{Item.all.pluck("name")}"
puts "Item1: #{Item1.name} price: #{Item1.price.round(2)}"
puts "Item2: #{Item2.name} price: #{Item2.price.round(2)}"
puts "Item3: #{Item3.name} price: #{Item3.price.round(2)}"
puts "Item4: #{Item4.name} price: #{Item4.price.round(2)}"
puts "Item5: #{Item5.name} price: #{Item5.price.round(2)}"

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
