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
            @config.setValue(@subcommand)
            @in_out.write_rpconfig(@config.yaml_data())
        end
    end

    def is_executable?
        case @subcommand.size
        when 1 then
            unless @config.isVaildShowAll?(@subcommand)
                show_help()
                return false
            end
        when 3 then
            unless @config.isVaildConfigName?(@subcommand)
                show_help()
                return false
            end
        else
            show_help()
            return false
        end

        return true
    end

    def show_help
        puts "Command: config"
        puts "Usage 1: rp config"
        puts "    Show configure list."
        puts "Usage 2: rp config [config-name] [value]"
        puts "    Set value to configure."
        puts "(e.g.)"
        puts "$ rp config"
        puts "*Configure Name: Value"
        puts "list_item_a: 1"
        puts "list_item_b: 2"
        puts "$ rp config list_item_a 3"
    end
end