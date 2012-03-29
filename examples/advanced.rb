require 'micromachine'

# This example can be run with ruby -I lib/ example/advanced.rb

fsm = MicroMachine.new(:pending)

fsm.when(:confirm,  :pending => :confirmed)
fsm.when(:ignore,   :pending => :ignored)
fsm.when(:reset,    :confirmed => :pending, :ignored => :pending)

puts "Should print Confirmed, Pending and Ignored:"

fsm.on(:any) do
  puts fsm.state.capitalize
end

fsm.trigger(:confirm)

fsm.trigger(:ignore)

fsm.trigger(:reset)

fsm.trigger(:ignore)
