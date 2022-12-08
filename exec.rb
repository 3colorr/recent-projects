require_relative "src/dispatcher"
require_relative "src/options"

options = Options.new

if options.validate?(ARGV)
    dispatcher = Dispatcher.new(ARGV)
    dispatcher.run
end
