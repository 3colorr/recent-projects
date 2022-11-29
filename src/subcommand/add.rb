require_relative "../model/registered"
require_relative "../inout"
require_relative "command"

class Add < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @registered = @in_out.read_registered()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        escaped_path = @subcommand[2].gsub(" ", "\\ ")
        @registered << Registered.new({name: @subcommand[1], path: escaped_path})
        zipped = @registered.map { |m| m.zipped }
        
        @in_out.write_registered(zipped)
    end

    def is_executable?
        if @subcommand.size != 3
            show_help()
            return false
        end

        unless File.exist?(@subcommand[2])
            show_help()
            return false
        end

        return true
    end

    def show_help
        puts "Usage: your-alias-launcer add <app-name> </path/to/app>"
    end
end