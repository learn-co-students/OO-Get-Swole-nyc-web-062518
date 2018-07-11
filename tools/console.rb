require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


nysc = Gym.new("NYSC")
equinox = Gym.new("Equinox")

ann = Lifter.new("Ann", 100)
jack = Lifter.new("Jack", 130)
rose = Lifter.new("Rose", 200)

member1 = Membership.new(100, nysc, ann)
member2 = Membership.new(130, equinox, jack)
member3 = Membership.new(200, equinox, rose)

binding.pry
