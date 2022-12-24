require_relative "../inout"
require_relative "command"

class List < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @history = @in_out.read_history()
        @config = @in_out.read_rpconfig()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        @history.each.with_index(1) do |m, i|

            break if i > @config.max_number_of_history

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
        puts "Command: list, ls"
        puts "    Show recently opened projects along with 'history id'."
        puts "Usage: rp list (or rp ls)"
    end

    def show_none_history
        puts "No history."
    end
end