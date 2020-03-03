require("pry-byebug")
require_relative("models/property_tracker")

PropertyTracker.delete_all()

house1 = PropertyTracker.new({
  "address" => "123 A Street",
  "value" => 1000000000,
  "bedrooms" => 1,
  "year_built" => 1852
  })

house1.save()
binding.pry()
nil
