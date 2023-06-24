require_relative "../model/history"

class Launcher < Command
    def initialize(subcommand)
        @subcommand = subcommand

        @in_out = InOut.new()
        @history = @in_out.read_history()
        @registered = @in_out.read_registered()
    end

    def run
        return unless is_executable?

        puts "Open: #{@project}"
        system("#{@app} #{@project}")
    end

    def is_executable?
        #Do not validate except for subcommand size 1 or 2.
        unless (1..2).cover?(@subcommand.size)
            show_help()
            return false
        end

        if @subcommand.size == 2
            app = @registered.select { |m| m.name == @subcommand[0] }
            if app.empty?
                show_invaild_app(@subcommand[0])
                return false
            end

            unless Dir.exist?(@subcommand[1])
                show_invaild_project(@subcommand[1])
                return false
            end

            @app = app.first.path
            @project = (@subcommand[1] == ".") ? Dir.pwd : @subcommand[1]

            #Add a latest history to top of history list.
            if @history.size > 0
                @history.map { |m| m.order_backward() }
            end
            latest = History.new({open_by: @subcommand[0], project: @project, order: 1})
            @history.unshift(latest)
            @in_out.write_history(@history.map { |m| m.zipped })
        
        else
            #
            # This validation is @subcommand.size == 1
            #

            history_number = /[1-9][0-9]*/.match(@subcommand[0])
            if history_number.nil?
                show_invaild_history_number(@subcommand[0])
                return false
            end

            history = @history.select { |m| m.order == history_number[0].to_i }
            if history.empty?
                show_invaild_history_number(@subcommand[0])
                return false
            end

            app = @registered.select { |m| m.name == history.first.open_by }

            @app = app.first.path
            @project = history.first.project

            #Executed history is moved to top of history list.
            if @history.size > 1
                @history.insert(0, @history.delete_at(history.first.order - 1))
                @history.map.with_index(1) { |m, i| m.set_order(i) }
                @in_out.write_history(@history.map { |m| m.zipped })
            end
        end

        return true
    end

    def show_help
        puts "Usage:"
        puts "1. rp <app-name> </path/to/project>"
        puts "2. rp <history-number>"
    end

    def show_invaild_app(name)
        puts "Invaild app name. => #{name}"
    end

    def show_invaild_project(name)
        puts "Invaild project path. => #{name}"
    end

    def show_invaild_history_number(number)
        puts "Invaild history number. => #{number}"
    end
end
