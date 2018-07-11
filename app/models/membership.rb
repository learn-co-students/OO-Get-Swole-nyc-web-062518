require 'pry'

class Membership

  @@all = []

  attr_reader :cost, :gym, :lifter

  def initialize(cost, gym, lifter)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self
  end

  def self.all
    @@all
  end
end
