class Config
    def initialize(data)
        @config = data
    end

    def max_number_of_history
        return @config["max_number_of_history"]
    end

    def zipped
        [@config["app"], @config["path"]]
    end
end