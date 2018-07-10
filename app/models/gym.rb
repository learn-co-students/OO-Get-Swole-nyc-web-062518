class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
  	Membership.all.select do |membership|
  		membership.gym == self
  	end
  end

  def lifters
  	memberships.map do |membership|
  		membership.lifter
  	end
  end

  def lifter_names
  	lifters.map do |lifter|
  		lifter.name
  	end
  end

  def lift_total_for_gym
  	lift_total = lifters.map do |lifter|
  		lifter.lift_total
  	end
  	lift_total.inject(0){|sum, x| sum + x}
  end

end
