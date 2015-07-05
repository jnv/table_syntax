require "test_helper"
require "table_syntax"

class TableSyntaxTest < Minitest::Test
  def test_version
    refute_nil ::TableSyntax::VERSION
  end

  def test_build

    t = TableSyntax.build(:col1, :col2) do
      :a | :b
    end

    t.each do |row|
      assert_equal :a, row.col1
      assert_equal :b, row.col2
    end

  end

end
