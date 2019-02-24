class CashRegister
  attr_accessor :total, :discount, :item_list, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
    @item_list = []
  end

  def add_item(title, price, quantity = 1)
      self.total += (price * quantity)
      (quantity).times{self.item_list << title}
      self.last_transaction = (price * quantity)


  end

  def apply_discount
    if self.discount != 0
      self.total -= (self.total * (self.discount/100)).round
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

def items
  self.item_list
end

def void_last_transaction
  self.total -= self.last_transaction
end


end
