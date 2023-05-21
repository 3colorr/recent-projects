require_relative "subcommand/add"
require_relative "subcommand/launcher"
require_relative "subcommand/list"
require_relative "subcommand/remove"
require_relative "subcommand/apps"
require_relative "subcommand/config"

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
        
        when "apps"
            apps = Apps.new(@subcommand)
            apps.run()

        when "config"
            config = Config.new(@subcommand)
            config.run()

        else
            launcher = Launcher.new(@subcommand)
            launcher.run
        end
    end
end