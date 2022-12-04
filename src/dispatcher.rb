require_relative "subcommand/add"
require_relative "subcommand/launcher"
require_relative "subcommand/list"
require_relative "subcommand/remove"

class Dispatcher
    def initialize(args)
        @subcommand = args
    end

    def run
        case @subcommand.first
        when "add"
            add = Add.new(@subcommand)
            add.run()

        when "remove", "rm"
            remove = Remove.new(@subcommand)
            remove.run()

        when "list", "ls"
            list = List.new(@subcommand)
            list.run()
            
        else
            launcher = Launcher.new(@subcommand)
            launcher.run
        end
    end
end