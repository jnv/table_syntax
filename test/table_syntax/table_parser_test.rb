require 'test_helper'
require 'table_syntax/table_parser'

module TableSyntax
  class TableTest < Minitest::Test

    def test_parse
      blk = Proc.new do
        :a | :b | :c
        :d | :e | :f
      end
      parsed = TableParser.parse(blk)
      assert_equal [[:a, :b, :c], [:d, :e, :f]], parsed
    end
  end
end
