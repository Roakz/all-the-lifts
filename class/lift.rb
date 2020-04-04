class Lift 

attr_reader :lift_num, :time_until_free, :job_que
 
  def initialize(lift_num, store)
    @lift_num = lift_num
    @current_floor = "Ground"
    @destination = nil
    @job_que = []
    @time_until_free = nil
    self.add_to_store(store)
  end

  def add_to_store(store)
    store.store_lift(self)
  end
end