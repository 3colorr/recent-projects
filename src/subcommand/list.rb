require_relative "../model/registered"
require_relative "../inout"
require_relative "command"

class List < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @history = @in_out.read_history()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        @history.each do |m|
            puts "#{m.order}. #{m.name} open by #{m.open_by}"
            puts " ---- #{m.project}"
        end
    end

    def is_executable?
        if @subcommand.size != 1
            show_help()
            return false
        end

        if @history.empty?
            show_none_history()
            return false
        end

        return true
    end

    def show_help
        puts "Usage: your-alias-launcer list"
    end

    def show_none_history
        puts "None any history."
    end
end