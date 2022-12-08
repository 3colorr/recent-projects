require_relative "../inout"
require_relative "command"

class Apps < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @registered = @in_out.read_registered()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        @registered.each do |m|
            puts "#{m.name}"
            puts " -- #{m.path}"
        end
    end

    def is_executable?
        if @subcommand.size != 1
            show_help()
            return false
        end

        if @registered.empty?
            show_none_registered()
            return false
        end

        return true
    end

    def show_help
        puts "Command: apps"
        puts "    Show registered apps and path."
        puts "Usage: rp apps"
    end

    def show_none_registered
        puts "No apps registered."
    end
end