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

        @registered << Registered.new({name: @app_name, path: @app_path})
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

        app_name = @subcommand[1]
        escaped_path = @subcommand[2].gsub(" ", "\\ ")

        #Check duplication
        @registered.each do |m|
            if m.name == app_name
                show_duplication_error(app_name)
                return false
            end

            ## What about a path?
            #if m.path == escaped_path
            #    show_duplication_error(escaped_path)
            #    return false
            #end
        end

        @app_name = app_name
        @app_path = escaped_path

        return true
    end

    def show_help
        puts "Command: add"
        puts "    Register an app along with installed path."
        puts "Usage: your-alias-launcer add <app-name> </path/to/app>"
    end

    def show_duplication_error(target)
        puts "Error: '#{target}' is already exist."
        puts "Please use another one."
    end
end