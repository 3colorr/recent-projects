class RpConfig
    def initialize(data)
        @config = data

        @config_command = 0
        @config_name = 1
        @config_value = 2
    end

    def show_all
        puts "*Configure Name: Value"
        @config.each do |key, value|
            puts "#{key}: #{value}"
        end
    end

    def isVaildConfigName?(subcommand)
        return @config.has_key?(subcommand[@config_name])
    end

    def isVaildShowAll?(subcommand)
        return subcommand[@config_command] == "config"
    end

    def setValue(subcommand)
        @config[subcommand[@config_name]] = subcommand[@config_value]
    end

    def yaml_data
        return @config
    end

    def max_number_of_history
        return @config["max_number_of_history"]
    end
end