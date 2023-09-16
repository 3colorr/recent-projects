class RpConfig
    def initialize(data, default_data)
        @config = data
        @default_config = default_data

        if @config.size < @default_config.size
            @default_config.each do |key, value|
                unless @config.has_key?(key)
                    @config[key] = value
                end
            end
        end

        @config_command = 0
        @config_name = 1
        @config_value = 2
    end

    def show_all
        puts "----"
        puts "usage: rp config config_name value"
        puts "--------------------------------------------"
        puts "* Configure Name: Value"
        puts "--------------------------------------------"
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

    # copy_project_path_to_clipboard is boolean method that copy project path to clipboard.
    # If copy_project_path_to_clipboard is '0', return false.
    # If copy_project_path_to_clipboard is '1', return true.
    # If copy_project_path_to_clipboard is not '0' or '1' or exception, return false.
    def is_copy_project_path_to_clipboard
        begin
            return Integer(@config["copy_project_path_to_clipboard"]) == 1

        rescue ArgumentError => exception_argument_error
            val = default_copy_project_path_to_clipboard
            puts "------------------------------------------------------------"
            puts "copy_project_path_to_clipboard can not convert to integer. -> #{@config["copy_project_path_to_clipboard"]}"
            puts "Use default value. -> #{val}"
            puts "Set default value:#{val} to copy_project_path_to_clipboard."
            puts "------------------------------------------------------------"

            @config["copy_project_path_to_clipboard"] = val
            return false

        rescue TypeError => exception_type_error
            val = default_copy_project_path_to_clipboard
            puts "------------------------------------------------------------"
            puts "copy_project_path_to_clipboard may be nil. -> #{@config["copy_project_path_to_clipboard"]}"
            puts "Use default value. -> #{val}"
            puts "Set default value:#{val} to copy_project_path_to_clipboard."
            puts "------------------------------------------------------------"

            @config["copy_project_path_to_clipboard"] = val
            return false
        end
    end

    # default_copy_project_path_to_clipboard return default value of copy_project_path_to_clipboard.
    # Default value is @default_config["copy_project_path_to_clipboard"].
    # If default value is exception, set @config["copy_project_path_to_clipboard"] to val(='0') and then return val.
    def default_copy_project_path_to_clipboard
        begin
            return Integer(@default_config["copy_project_path_to_clipboard"])

        rescue ArgumentError => exception_argument_error
            val = 0
            puts "----------------------------------"
            puts "Invaild default value. -> #{@default_config["copy_project_path_to_clipboard"]}"
            puts "Use a value. -> #{val}"
            puts "Set a value:#{val} to copy_project_path_to_clipboard."
            puts "------------------------------------------------------------"

            @config["copy_project_path_to_clipboard"] = val
            return val

        rescue TypeError => exception_type_error
            val = 0
            puts "----------------------------------"
            puts "Nothing default value. -> #{@default_config["copy_project_path_to_clipboard"]}"
            puts "Use a value. -> #{val}"
            puts "Set a value:#{val} to copy_project_path_to_clipboard."
            puts "------------------------------------------------------------"

            @config["copy_project_path_to_clipboard"] = val
            return val
        end
    end
end