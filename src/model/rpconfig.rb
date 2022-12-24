class RpConfig
    def initialize(data)
        @config = data
    end

    def max_number_of_history
        return @config["max_number_of_history"]
    end
end