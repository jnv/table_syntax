require 'test_helper'
require 'table_syntax/row'

module TableSyntax
  class RowTest < Minitest::Test
    def row
      @row ||= Row.new(:param1)
    end

    def test_to_a
      assert_equal [:param1], row.to_a
    end

    def test_to_params
      assert_equal [[:param1]], row.to_params
    end

    def test_add_param
      row.add_param(:param2)
      assert_equal [:param1, :param2], row.to_a
    end
  end
end
