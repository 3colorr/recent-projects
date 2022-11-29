class Registered
    def initialize(data)
        @name = data[:name]
        @path = data[:path]
    end

    def name
        return @name
    end

    def path
        return @path
    end

    def zipped
        return {name: @name, path: @path}
    end
end