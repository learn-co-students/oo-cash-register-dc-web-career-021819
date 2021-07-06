class CashRegister
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    

    def add_item (name, price, quantity = 1)
        @total+= price * quantity
        quantity.times do 
            @items << name
        end
        @last_item = [name, price, quantity]
    end

    def apply_discount
        if (discount > 0)
            @total -= @total * discount/100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @last_item[2].times do 
            @items.pop
            @total -= @last_item[1]
        end
    end
end