# Keeping track of who is where in the tower configuring levels and all that jazz.

class TheDarkTower

attr_reader :levels, :people_store

def initialize(levels) 

  @levels = levels
  @people_store = {}
  
  count = 0
  while count < levels
    @people_store["level#{count + 1}"] = Array.new
    count += 1
  end

end

end