class Product < ActiveRecord::Base
  include ProductValidations

  validates :amount, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}

  def order(order_amount)
    transaction do
      order = Order.current || Order.create
      OrderProduct.add(order, self, order_amount)
      self.amount = amount - order_amount
      save!
    end
  end

  def reserve=(order_amount)
    order order_amount if order_amount.between? 1, amount
  end

  def self.create_bid
    bid = Bid.new
    self.all.each do |product|
      if product.amount_needed
        transaction do
          bid.save! if bid.new_record?
          BidProduct.add(bid, product, product.amount_needed)
        end
      end
    end
    # TODO: implement me
    # create bid and add all products with small amount to bid
  end

  def amount_needed
    min_amount = min_amount_default # temporary setting
    min_amount - amount if amount < min_amount
  end

  def min_amount_default
    Setting.find_by_name('product_min_amount').try(:number) || 0
  end
end
