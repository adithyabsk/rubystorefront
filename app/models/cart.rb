class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def sub_total
    return self.cart_items.sum { |l| l.sub_total_cost}
  end
  
  def tax
	return self.cart_items.sum { |l| l.tax}
  end
  
  def total_cost
	if ((Time.zone.now - User.find(self.user_id).dob.to_time) / 1.year.seconds).floor > 65
		return self.cart_items.sum { |l| l.total_cost*0.9}
	else
		return self.cart_items.sum { |l| l.total_cost}
	end
  end
end

