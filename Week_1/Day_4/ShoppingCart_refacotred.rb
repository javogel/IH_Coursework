
class ShoppingCart

  def initialize
    @items = []
    @coupon = []
  end

  def add_items(item)
    @items << item
  end

  def add_coupon(coupon)
    @coupon << coupon
  end

  def show

    @items.each do |item|
     puts "#{item.nombre}: $#{item.precio}"
    end


  end


  def cost
    @items.reduce(0) { |sum, item| sum + item.precio}

  end




end


class Item
  attr_reader :nombre
  attr_accessor :precio

  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end


end



class Coupon

  attr_reader :nombre, :item, :amount_when_applied

  def initialize(nombre, item, amount_when_applied)
    @nombre = nombre
    @item = item
    @amount_when_applied = amount_when_applied
  end

  def aplicar(item, count)

  end

  def info_coupones
    puts "Se ha aplicado el coupon #{@nombre} a la compra de #{@item.to_s}"
  end

end


class SpecialCoupon < Coupon
  attr_reader :nombre, :item, :amount_when_applied, :extra_item

  def initialize(nombre, item, amount_when_applied, extra_item)
    super(nombre, item, amount_when_applied)
    @extra_item = extra_item
  end
end


cart = ShoppingCart.new
apple = Item.new("apple", 10)
apple1 = Item.new("apple", 10)
cart.add_items(apple)
cart.add_items(apple1)
cart.add_items(Item.new("orange", 5))
cart.add_items(Item.new("orange", 5))
cart.add_items(Item.new("orange", 5))
cart.add_items(Item.new("orange", 5))
cart.add_items(Item.new("orange", 5))
cart.add_items(Item.new("grapes", 15))
cart.add_items(Item.new("banana", 20))
cart.add_items(Item.new("watermelon", 50))


cart.add_coupon(Coupon.new("2 por 1", "apple", 2))
cart.add_coupon(Coupon.new("3 por 2", "orange", 3))
cart.add_coupon(SpecialCoupon.new("1 free banana for every 4 grapes", "grapes", 4,"banana"))

cart.show
puts cart.cost
