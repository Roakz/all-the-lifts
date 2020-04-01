# The travel master 3000 is the latest grooviest edition of lift control mastery that one could ever possibly imagine.

class TravelMaster3000

attr_reader :levels, :lifts

def initialize(levels, lifts)

  @levels = levels
  @lifts = lifts
  @travel_time_per_floor = 3 # <== 3 seconds per floor

end

end