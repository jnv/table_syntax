module TableSyntax
  class HeaderTable
    include Enumerable

    def initialize(headers, table)
      unless headers.all? {|h| h.kind_of?(Symbol) }
        raise "Headers must be symbols"
      end
      @struct = Struct.new(*headers)
      @rows = table.to_a
    end

    def each
      @rows.each do |row|
        yield @struct.new(*row)
      end
    end
  end
end
