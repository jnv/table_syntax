require "table_syntax/version"
require "table_syntax/table_parser"
require "table_syntax/header_table"

module TableSyntax

  def self.build(*headers, &blk)
    table = TableParser.parse(blk)
    HeaderTable.new(headers, table)
  end

end
