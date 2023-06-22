class History
    def initialize(data)
        @project = data[:project]
        @open_by = data[:open_by]
        @order = data[:order]
        @name = @project.split("/").last
    end

    def name
        return @name
    end

    def project
        return @project
    end

    def open_by
        return @open_by
    end

    def order
        return @order
    end

    def set_order(other)
        @order = other
    end

    def order_backward()
        @order += 1
    end

    def zipped
        return {project: @project, open_by: @open_by, order: @order}
    end

    def swap_order(other)
        tmp = @order
        @order = other.order
        other.set_order(tmp)
    end
end