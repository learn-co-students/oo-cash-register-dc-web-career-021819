require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      self.items << title
    end
    self.total += price * quantity
    self.last_transaction = price * quantity
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    end
    self.total -= self.total * (self.discount.to_f / 100)
    "After the discount, the total comes to $800."
  end

  def void_last_transaction
    self.total -= last_transaction
  end
end
