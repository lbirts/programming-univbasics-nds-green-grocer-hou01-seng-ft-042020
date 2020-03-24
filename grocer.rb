def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  item_index = 0
  while collection[item_index] do
    item = collection[item_index]
  if name == item[:item]
    return item
  end
  item_index += 1
end
nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  item_index = 0
  unique_array = []
  while cart[item_index] do
    item = cart[item_index]
    item_hash = find_item_by_name_in_collection(item[:item], unique_array)
    if item_hash
      item_hash[:count] += 1
    else 
      item_hash = item
      item_hash[:count] = 1
      unique_array << item_hash
    end
    item_index += 1
  end
  unique_array
end


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  item_index = 0
  while cart[item_index] do
    item = cart[item_index]
    coupon_item = find_item_by_name_in_collection(item[:item], coupons)
    if coupon_item
      item[:count] -= coupon_item[:num]
      cart << {
        :item => "#{coupon_item[:item]} W/COUPON",
        :price => (coupon_item[:cost] / coupon_item[:num]),
        :clearance => item[:clearance],
        :count => coupon_item[:num]
      }
    end
    item_index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  item_index = 0
  while item_index < cart.length do
    item = cart[item_index]
    if item[:clearance] == true
      item[:price] -= (item[:price] * 0.2)
    end
    
    cart << item[:price]
    item_index += 1
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
