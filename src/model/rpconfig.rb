class RpConfig
    def initialize(data, default_data)
        @config = data
        @default_config = default_data

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
        begin
            return Integer(@config["max_number_of_history"])

        rescue ArgumentError => exception_argument_error
            val = default_max_number_of_history
            puts "------------------------------------------------------------"
            puts "max_number_of_history can not convert to integer. -> #{@config["max_number_of_history"]}"
            puts "Use default value. -> #{val}"
            puts "Set default value:#{val} to max_number_of_history."
            puts "------------------------------------------------------------"

            @config["max_number_of_history"] = val
            return val

        rescue TypeError => exception_type_error
            val = default_max_number_of_history
            puts "------------------------------------------------------------"
            puts "max_number_of_history may be nil. -> #{@config["max_number_of_history"]}"
            puts "Use default value. -> #{val}"
            puts "Set default value:#{val} to max_number_of_history."
            puts "------------------------------------------------------------"

            @config["max_number_of_history"] = val
            return val
        end
    end

    def default_max_number_of_history
        begin
            return Integer(@default_config["max_number_of_history"])

        rescue ArgumentError => exception_argument_error
            val = 4
            puts "----------------------------------"
            puts "Invaild default value. -> #{@default_config["max_number_of_history"]}"
            puts "Use a value. -> #{val}"
            puts "Set a value:#{val} to max_number_of_history."
            puts "------------------------------------------------------------"

            @config["max_number_of_history"] = val
            return val

        rescue TypeError => exception_type_error
            val = 4
            puts "----------------------------------"
            puts "Nothing default value. -> #{@default_config["max_number_of_history"]}"
            puts "Use a value. -> #{val}"
            puts "Set a value:#{val} to max_number_of_history."
            puts "------------------------------------------------------------"

            @config["max_number_of_history"] = val
            return val
        end
    end
end