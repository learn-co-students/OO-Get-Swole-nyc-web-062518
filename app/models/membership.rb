class Membership

  ALL = []

  attr_reader :cost
  attr_accessor :lifter, :gym

  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym
    ALL << self
  end

  def self.all
    ALL
  end

end
