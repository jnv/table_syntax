require 'test_helper'
require 'table_syntax/header_table'

module TableSyntax
  class HeaderTableTest < Minitest::Test

    def table(headers = [:h1, :h2], table = [[:a, :b], [:c, :d]])
      HeaderTable.new(headers, table)
    end

    def test_initialize_error
      assert_raises(ArgumentError) do
        HeaderTable.new('lorem', :ipsum, 12345)
      end
    end

    def test_enumerable
      assert_kind_of Enumerable, table
      assert_kind_of Enumerator, table.each
    end

    def test_row_struct
      ht = table
      ht.each do |row|
        assert row.h1
        assert row.h2
      end
    end
  end
end
