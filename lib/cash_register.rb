require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_item_price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times do
      @items << item
    end
    @last_item_price = price
    @total += price * quantity
  end

  def apply_discount
    if @discount
      @total = @total - @total * @discount /100.0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end

end
