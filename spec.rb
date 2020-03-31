require 'test/unit'
require './class/travel_master_3000'

class TravelMaster3000Tests < Test::Unit::TestCase

def setup
  @travel_master_3000 = TravelMaster3000.new(10, 4)
end

def test_initializes_with_number_of_lifts
  assert_equal(@travel_master_3000.lifts, 4, message = "Travel master lifts initialized")
end

def test_initializes_with_number_of_levels
  assert_equal(@travel_master_3000.levels, 10, message = "Travel master levels initialized")
end

end