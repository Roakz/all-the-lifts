# The travel master 3000 is the latest grooviest edition of lift control mastery that one could ever possibly imagine.

class TravelMaster3000

attr_reader :levels, :lifts, :job
  
  def initialize(levels, lifts)
    @levels = levels
    @lifts = lifts
    @travel_time_per_floor = 3 # <== 3 seconds per floor
  end

  def calculate_initial_travel_time(floors_to_travel, opts={})
    if opts.fetch(:current_level) && opts.fetch(:current_level) == 0
      return (floors_to_travel * @travel_time_per_floor)
    end
  end

  def dispatch_job(job, opts = {})
    if opts.fetch(:current_level) == 0
      @shortest_time = []
      opts[:lift_store].lifts.each do |lift|
        if lift.time_until_free == nil
          break @shortest_time = lift
        end
        @shortest_time << lift.time_until_free
      end
      if !@shortest_time.instance_of? Array
        # @shortest_time is now a lift in this block
        return @shortest_time.job_quer(job)
      end
      p @shortest_time
    end
  end

  def request_travel_info(prompt, lift_store)
    @job_floor = prompt.slider('Select a floor', min: 0, max: @levels, step: 1)
    puts "Enter a travellers name:"
    @job_traveller = gets.chomp
    @job = {
      :floor => @job_floor,
      :traveller => @job_traveller,
      # Adjust travel time each time that a lift job que is changed
      :travel_time => calculate_initial_travel_time(@job_floor, opts = {:current_level => 0})
    }
    dispatch_job(@job, opts = {:current_level => 0, :lift_store => lift_store})
  end
end