class CashRegister

  attr_accessor :total, :items, :discount, :item_prices

  def initialize(discount=0.0)
    @total = 0.0
    @discount = discount
    @items = []
    @item_prices = []
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    quantity.times{self.items << title}
    self.item_prices << price
  end

  def apply_discount
    if self.discount == 0.0
      return "There is no discount to apply."
    else
    self.total = (self.total*((100.0 - discount)/100.0))
    "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= item_prices.pop
    self.items.pop
  end
end
