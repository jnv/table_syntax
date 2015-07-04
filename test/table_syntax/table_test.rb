require 'test_helper'
require 'table_syntax/table'
require 'table_syntax/row'

module TableSyntax
  class TableTest < Minitest::Test
    def table
      @table ||= Table.new
    end

    def row(param)
      Row.new(param)
    end

    def table2x2
      table.add_row(row(:a))
      table.add_param_to_last_row(:b)
      table.add_row(row(:c))
      table.add_param_to_last_row(:d)
    end

    def test_table2x2
      t = table2x2
      assert_equal [[:a, :b], [:c, :d]], t.to_a
      assert_equal t.to_params, t.to_a, "Alias #to_params does not match #to_a"
    end

    def test_pipe_alias
      table.add_row(row(:a))
      table | :b | :c
      assert_equal [[:a, :b, :c]], table.to_a
    end

  end
end
