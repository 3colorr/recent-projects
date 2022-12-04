require_relative "subcommand/add"
require_relative "subcommand/launcher"
require_relative "subcommand/list"

class Dispatcher
    def initialize(args)
        @subcommand = args
    end

    def run
        case @subcommand.first
        when "add"
            add = Add.new(@subcommand)
            add.run()

        when "remove"
            puts "ToDo: remove"

        when "list", "ls"
            list = List.new(@subcommand)
            list.run()
            
        else
            launcher = Launcher.new(@subcommand)
            launcher.run
        end
    end
end