require 'pry'
class CashRegister
  # attr_writer :total
  attr_accessor :total
  attr_reader :discount, :items

  # def items
  #   @items
  # end

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    @last_transaction = price * quantity
    @total += @last_transaction
    quantity.times {@items << title}
  end

  def apply_discount
    if @discount > 0
      @total *= (100.0 - @discount) / 100.0
      @discount = 0
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
  # def total
  #   @total
  # end
end
