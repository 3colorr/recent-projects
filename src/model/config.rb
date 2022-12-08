class Config
    def initialize(data)
        @config = data
    end

    def number_of_history
        return @config["number_of_history"]
    end

    def zipped
        [@config["app"], @config["path"]]
    end
end