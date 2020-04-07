require 'timers'

class Lift 

attr_reader :lift_num, :time_until_free, :job_que
 
  def initialize(lift_num, store)
    @lift_num = lift_num
    @current_floor = "Ground"
    @destination = nil
    @job_que = []
    @time_until_free = nil
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

  # currently for one lift to be multithreaded
  def do_work
    timers = Timers::Group.new
    File.open("Lift#{@lift_num}_movements.txt", 'w') do |file|
      while state?(:active) == true && @job_que.length > 0
        job = @job_que[0]
        job_timer = timers.after(job.fetch(:travel_time)) { file << "Dropping #{job.fetch(:traveller)} at level #{job.fetch(:floor)}" }
        timers.wait
        @job_que.reject! {|job| job == @job_que[0]}
        # Put some logging stuff here about the next job and append to file
      end
    end
  end
end