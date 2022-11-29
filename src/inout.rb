#
# The InOut class is a wrapper for the YAML library.
#

require "yaml"

class InOut

    def initialize
        root_path = File.expand_path(__dir__)
        @config_path = "#{root_path}/yaml/config.yaml"
        @history_path = "#{root_path}/yaml/history.yaml"
        @registered_path = "#{root_path}/yaml/registered.yaml"
    end

    def write_registered(data)
        write(data, @registered_path)
    end

    def write_history(data)
        write(data, @history_path)
    end

    def write_config(data)
        write(data, @config_path)
    end

    def read_registered
        data = read(@registered_path)
        return [] if data.nil?

        return data.map { |m| Registered.new(m) }
    end

    def read_history
        data = read(@history_path)
        return [] if data.nil?

        sorted_data = data.sort { |m1, m2| m1[:order] <=> m2[:order] }

        return sorted_data.map { |m| History.new(m) }
    end

    def read_config
        data = read(@config_path)
        return [] if data.nil?

        return data.map { |m| Config.new(m) }
    end
    
    private def write(data, path_to_yaml)
        YAML.dump(data, File.open(path_to_yaml, "w"))
    end

    private def read(path_to_yaml)
        unless File.exist?(path_to_yaml)
            File.create(path_to_yaml)
            return []
        end

        data = YAML.load_file(path_to_yaml)
        if data.nil?
            return []
        end

        return data
    end

    private def show_missing_file(path)
        puts "Missing. => #{path}"
        puts "Please check the README.md."
    end

    private def show_fail_load_file(path)
        puts "Load failed. => #{path}"
        puts "Please check the README.md."
    end
end