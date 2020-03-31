# A floor is selected and the current floor, destination and travellers name is provided, lift object requires total travel time.

# Some mathemtical genius will be ensued....notes for that:
# - There are 20 levels
# - lifts have a travel time per floor 
# - A travel time left for each lift is calculated and distance to travel back to the traveller is taken into account
# - whichever lift will get there quikest is allocated the job which is added to its stack
# - Lifts have a capacity of 10 people per lift
# - If a lift is completley free it returns to ground.

# - When a journey finshes there is a log to the console

app_config = { :lifts => 4 }

require './class/lift_store'
require './class/lift'

class 

lift_store = LiftStore.new()

def create_lifts(store, app_config)
count = 0
  while count < app_config[:lifts]
    store.lifts[count] = Lift.new((count + 1), store)
    count += 1
  end
end

create_lifts(lift_store, app_config)

p lift_store.stored_lifts
p lift_store.lifts
