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
        puts "Usage:"
        puts "your-alias-launcher <history id>"
        puts "Or ruby path/to/recent-projects/exec.rb <history id>"
        puts "\n--- Quick Start ---"
        puts " $your-alias-launcher add vscode /path/to/vscode/bin/code"
        puts " $your-alias-launcher vscode /path/to/your-projects"
        puts " >>> A next day..."
        puts " $your-alias-launcher list"
        puts " >1. your-project opened by vscode"
        puts " > ---- /path/to/your-projects"
        puts " $your-alias-launcher 1"
    end

    private def show_missing_option(users)
        puts users
        puts "You can use -h or --help to see help."
    end
end