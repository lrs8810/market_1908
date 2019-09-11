class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.inject([]) do |vendor_names, vendor|
      vendor_names << vendor.name
    end
  end

  def vendors_that_sell(item)
    vendor_sells_item = []
    @vendors.each do |vendor|
      vendor_sells_item << vendor if vendor.check_stock(item) > 0
    end
    vendor_sells_item
  end

  def all_vendors_inventory
    all_inventory = []
    @vendors.each do |vendor|
      all_inventory << vendor.inventory
    end
    all_inventory
  end

  def sorted_item_list
    all_items = []
    all_vendors_inventory.each do |vendor_inventory|
      vendor_inventory.each do |item, quantity|
        all_items << item
      end
    end
    all_items.uniq.sort
  end

  def total_inventory
    all_vendors_inventory.inject(Hash.new(0)) do |total_inventory, inventory|
      inventory.each do |item, quantity|
        total_inventory[item] += quantity
      end
      total_inventory
    end
  end

  def sell(sold_item, sold_quantity)
    # total_inventory.select do |item, quantity|
    #   # require 'pry'; binding.pry
      if sold_item == total_inventory[item] && sold_quantity <= quantity
        return true
      else
        return false
      end
    end
  end
end
