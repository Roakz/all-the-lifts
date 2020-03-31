class LiftStore

attr_accessor :stored_lifts, :store_lift , :lifts

  def initialize
    @stored_lifts = 0
    @lifts = []
  end

  def store_lift(lift)
    @stored_lifts = @stored_lifts += 1
    @lifts << lift
  end
end 