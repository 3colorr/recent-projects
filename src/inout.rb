#
# The InOut class is a wrapper for the YAML library.
#

require "yaml"
require "fileutils"
require_relative "model/history"
require_relative "model/registered"
require_relative "model/rpconfig"

class InOut

    def initialize
        root_path = File.expand_path(__dir__)
        @rpconfig_path = "#{root_path}/yaml/config.yaml"
        @rpconfig_default_path = "#{root_path}/yaml/config-default.yaml"
        @history_path = "#{root_path}/yaml/history.yaml"
        @registered_path = "#{root_path}/yaml/registered.yaml"

        unless is_exist_config?
            puts ">> Info"
            puts "Not found config.yaml."
            puts "Initialized: Created a new config.yaml."
            puts "------------------------------------------"
        end
    end

    def is_exist_config?
        unless File.exist?(@rpconfig_path)
            FileUtils.cp(@rpconfig_default_path, @rpconfig_path)
            return false
        end
        
        return true
    end

    def write_registered(data)
        write(data, @registered_path)
    end

    def write_history(data)
        write(data, @history_path)
    end

    def write_rpconfig(data)
        write(data, @rpconfig_path)
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

    def read_rpconfig
        data = read(@rpconfig_path)
        return [] if data.nil?

        default_data = read(@rpconfig_default_path)

        return RpConfig.new(data, default_data)
    end
    
    private def write(data, path_to_yaml)
        YAML.dump(data, File.open(path_to_yaml, "w"))
    end

    private def read(path_to_yaml)
        unless File.exist?(path_to_yaml)
            FileUtils.touch(path_to_yaml)
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