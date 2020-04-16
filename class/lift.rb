require 'timers'

class Lift 

attr_reader :lift_num, :time_until_free, :job_que
attr_accessor :movements
 
  def initialize(lift_num, store)
    @lift_num = lift_num
    @current_floor = "Ground"
    @destination = nil
    @job_que = []
    @time_until_free = nil
    @movements = File.new("Lift#{@lift_num}_movements.txt", "w")
    @timers = Timers::Group.new
    @state = {
      :active => false
    }
    self.add_to_store(store)
  end

  def state_updater(key)
    @state[key] = !@state[key]
  end

  def state?(key)
    !!@state[key]
  end

  def add_to_store(store)
    store.store_lift(self)
  end

  def job_quer(job)
    if state?(:active) == false
      @job_que << job
      state_updater(:active)
      return do_work()
    end
    @job_que << job 
  end

  def do_work
    Thread.new do
      while state?(:active) == true && self.job_que.length > 0
         job = self.job_que[0]
         job_timer = @timers.after(job.fetch(:travel_time)) { File.write(@movements, "Dropping #{job.fetch(:traveller)} at level #{job.fetch(:floor)} \n", mode: "a") }
         File.write(@movements, "Picked up #{job.fetch(:traveller)} from level #{job.fetch(:current_level)} \n", mode: "a")
         @timers.wait
         @job_que.reject! {|job| job == @job_que[0]}
      end
      state_updater(:active)
    end
  end
end

# add some sleep time between jobs depending on travel time back to floor
# This will be adjusted again later when sorting algorithm is implemented.

# work on other menu options for reading file and viewing where people are.