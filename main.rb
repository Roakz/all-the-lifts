
app_config = { :lifts => 4, :levels => 10 }

require  "tty-prompt"
require './class/lift_store'
require './class/lift'
require './class/the_dark_tower'
require './class/travel_master_3000'

lift_store = LiftStore.new()
the_dark_tower = TheDarkTower.new(app_config[:levels])
travel_master_3000 = TravelMaster3000.new(app_config[:levels], app_config[:lifts])
prompt = TTY::Prompt.new

def create_lifts(store, app_config)
count = 0
  while count < app_config[:lifts]
    store.lifts[count] = Lift.new((count + 1), store)
    count += 1
  end
end

create_lifts(lift_store, app_config)

loop do
  choices = ['Holla for a lift!', 'See who is where?', 'View Lift movements.', 'Sayonara!']
  task_selection = prompt.select("What would you like to do?", choices)
  task_selection == choices[0] ? job = travel_master_3000.request_travel_info(prompt, lift_store) : "insert a see who is where thing here" 
  if task_selection == "Sayonara!" 
    lift_store.lifts.each do |lift|
      File.delete(lift.movements)
    end
    puts "Thanks for travelling friend !"
    exit
  end
end