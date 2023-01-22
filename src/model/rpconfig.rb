class RpConfig
    def initialize(data)
        @config = data
    end

    def show_all
        @config.each do |key, value|
            puts "#{key}: #{value}"
        end
    end
    
    def max_number_of_history
        return @config["max_number_of_history"]
    end
end