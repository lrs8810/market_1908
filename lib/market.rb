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
end
