require("pry-byebug")
require_relative("models/property_tracker")

PropertyTracker.delete_all()

house1 = PropertyTracker.new({
  "address" => "123 A Street",
  "value" => 1000000000,
  "bedrooms" => 1,
  "year_built" => 1852
  })

  house2 = PropertyTracker.new({
    "address" => "124 B Street",
    "value" => 1006000000,
    "bedrooms" => 2,
    "year_built" => 1858
    })

    house3 = PropertyTracker.new({
      "address" => "125 C Road",
      "value" => 10000,
      "bedrooms" => 6,
      "year_built" => 2019
      })

house1.save()
house2.save()
house3.save()
binding.pry()
nil
