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

  def do_work
    while state?(:active) == true && @job_que.length > 0
      puts "working"
    end
  end
   
end