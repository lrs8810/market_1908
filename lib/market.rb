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
    all_vendors_inventory.each do |hash|
      hash.each do |key, value|
        all_items << key
      end
    end
    all_items.uniq.sort
  end
end
