require_relative "../inout"
require_relative "command"

class Config < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @config = @in_out.read_rpconfig()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        if @subcommand.size == 1
            @config.show_all
        else

        end
    end

    def is_executable?
        if @subcommand.size > 2
            show_help()
            return false
        end

        return true
    end

    def show_help
        puts "Command: config"
        puts "    Show recently opened projects along with 'history id'."
        puts "Usage: rp config [-option value]"
    end
end