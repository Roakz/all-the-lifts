# There are 4 lifts provided initially 

# A floor is selected and the current floor, destination and travellers name is provided, lift object requires total travel time.

# Some mathemtical genius will be ensued....notes for that:
# - There are 20 levels
# - lifts have a travel time per floor 
# - A travel time left for each lift is calculated and distance to travel back to the traveller is taken into account
# - whichever lift will get there quikest is allocated the job which is added to its stack
# - Lifts have a capacity of 10 people per lift
# - If a lift is completley free it returns to ground.

# - When a journey finshes there is a log to the console
class Lift 

attr_reader :lift_num
 
  def initialize(lift_num, store)
  
    @lift_num = lift_num
    self.add_to_store(store)
  
  end

  def add_to_store(store)
    store.store_lift()
  end

end

class LiftStore

  attr_accessor :stored_lifts, :store_lift 

  def initialize
  
    @stored_lifts = 0
  
  end

  def store_lift()
  
    @stored_lifts = @stored_lifts += 1
  
  end

end 

lift_store = LiftStore.new()
def local_variable_set(lifts, num)
 lifts << :"lift_#{num + 1}".to_sym => Lift.new((num + 1), lift_store)
end

lifts = {}
count = 0
while count < 3
local_variable_set(lifts, 1)
count += 1
end
p lift_store.stored_lifts

# build out lift objects with required parameters
# rehash on setting required lifts by user and look into dynamic rendering of the lift names.

