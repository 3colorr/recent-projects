#
# The options class parse subcommands and options and then validate thems.
# It also provides a help message and version infomations.
#
require "OptionParser"
require_relative "Versions"

class Options
    def initialize
        @opt = OptionParser.new
        @opt.on("-v", "--version", "Version") { |v| Versions.show_version(); exit}
        @opt.on("-h", "--help", "This is help") { |v| show_help(); exit}
    end

    def validate?(args)
        begin
            @subcommands = @opt.parse!(args)
            return true
        rescue OptionParser::InvalidOption => exp_invaild_option
            puts show_missing_option(exp_invaild_option.to_s)
        end

        return false
    end

    private def show_help
        puts "Usage: your-alias-launcher [-v | --version][-h | --help]"
        puts "                           [<command> <args>][<history id>]"
        puts "\nnote: If you have not set an alias path to exec.rb,"
        puts "      you have to enter '~/recent-project/exec.rb' instead of 'your-alias-launcher'."
        puts "\nIf you want to know more, please see the README.md.\n"
        puts "\nThere are some commands:"
        puts "  list  Show recently opened projects with 'history id'."
        puts "  add   Register an app along with installed path."
        puts "        (e.g.) your-alias-launcher <app-name> </path/to/app>"
        puts "                           [add <app-name> </path/to/app>]"
        puts "\n--- Quick Start ---"
        puts "(e.g.)We open `my-project` with VSCode. And the next day, we poen `my-project` with VSCode and work."
        puts "$your-alias-launcher add vscode /path/to/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
        puts "$your-alias-launcher vscode /path/to/your-projects"
        puts " >>> A next day..."
        puts "$your-alias-launcher list"
        puts " >1. your-project opened by vscode"
        puts " > ---- /path/to/your-projects"
        puts "$your-alias-launcher 1"
    end

    private def show_missing_option(users)
        puts users
        puts "You can use -h or --help to see help."
    end
end