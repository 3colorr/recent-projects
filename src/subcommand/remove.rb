require_relative "../inout"
require_relative "command"

class Remove < Command
    def initialize(subcommand)
        @in_out = InOut.new()
        @registered = @in_out.read_registered()
        @subcommand = subcommand
    end
    
    def run
        return unless is_executable?

        @registered.delete_at(@app_index)
        zipped = @registered.map { |m| m.zipped }
        
        @in_out.write_registered(zipped)
    end

    def is_executable?
        if @subcommand.size != 2
            show_help()
            return false
        end

        app_name = @subcommand[1]
        @app_index = -1

        #Check exist
        @registered.each_with_index do |m, i|
            if m.name == app_name
                @app_index = i
                break
            end
        end

        if @app_index == -1
            show_not_found_error(app_name)
            return false
        end

        return true
    end

    def show_help
        puts "Command: remove, rm"
        puts "    Remove registered app."
        puts "Usage: rp remove <app-name> (or rp rm <app-name>)"
    end

    def show_not_found_error(target)
        puts "Error: '#{target}' does not exist."
    end
end