
class Lifter

	ALL = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all
  	ALL
  end

  def memberships
  	Membership.all.select do |membership|
  		membership.lifter == self
  	end
  end

  def gyms
  	memberships.map do |membership|
  		membership.gym
  	end
  end

  def self.average_lift
  	lift_total_array = self.all.map do |lifter|
  		lifter.lift_total
  	end
  	lift_total_array.inject{|sum, x| sum + x}.to_f / lift_total_array.size
  end

  def sign_up(cost, gym)
  	Membership.new(self, gym, cost)
  end

  def total_cost
  	cost_array = memberships.map do |membership|
  		membership.cost
  	end
  	cost_array.inject(0) {|sum, x| sum + x}
  end

end
