class Command
    def initialize
        #Nothing to do
    end

    def run
        raise NotImplementedError
    end

    def is_executable?(subcommand)
        raise NotImplementedError
    end

    def show_help
        raise NotImplementedError
    end
end