
class ShoppingCart

  def initialize
    @prices = {:apple => 10, :orange => 5, :grapes => 15, :banana => 20, :watermelon => 50}
    @cart = {}
  end

  def add_item_to_cart(item)
    if !@cart[item]
       @cart[item] = 1
    else
       @cart[item] += 1
    end
  end


  def show
    @cart.each {|x,y| puts "#{y.to_s} #{x.to_s}: $#{@prices[x]}"}
  end


  def cost
    sum = 0
    @cart.each do |x,y|
      if x.to_s =="apple" && (y>=2)
        sum += (y * @prices[x]) - ((y/2)*@prices[x])
        puts "You got 2 apples for the price of 1"
      elsif x.to_s =="orange" && (y>=3)
        sum += (y * @prices[x]) - ((y/3)*@prices[x])
        puts "You got 3 oranges for the price of 2"
      elsif x.to_s =="grapes" && (y>=4)

          puts "You got a free banana for buying 4 grapes"
          #  @cart[:banana] = 1

        sum += (y * @prices[x])
      else
        sum += (y * @prices[x])
      end
    end

    puts "Total cost: $#{sum}"
  end


end



class Coupon
  def initialize(nombre, item, amount_when_applied)
    @nombre = nombre
    @item = item
    @amount_when_applied = amount_when_applied
  end

  def aplicar

  end

  def info_coupones
    puts "Se ha aplicado el coupon #{@nombre} a la compra de #{@item.to_s}"
  end

end


class SpecialCoupon < Coupon
  def initialize(nombre, item, amount_when_applied)
    super(nombre, item, amount_when_applied)
  end
end


cart = ShoppingCart.new

cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange

cart.show


cart.cost
