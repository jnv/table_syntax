require 'test_helper'
require 'table_syntax/pipe'

module TableSyntax
  class PipeTest < Minitest::Test
    using TableSyntax::Pipe

    BIGNUM = 4611686018427387903 ** 2

    def binding_wrapper
      yield
    end

    def test_bignum_sanity
      assert_instance_of Bignum, BIGNUM
    end

    def test_pipe_constructor
      t = :a | :b
          :c | :d

      assert_instance_of Table, t
      assert_equal [[:a, :b], [:c, :d]], t.to_a
    end

    def test_side_effect_permanence
      exp1 = [nil, nil, nil]
      exp2 = [nil, :b, nil]
      t = nil | nil | nil
      assert_equal [exp1], t.to_a

      nil | :b | nil
      assert_equal [exp1, exp2], t.to_a
    end

    # XXX: In the implementation table is bound to its caller,
    #      thus we need to define individual method for each comparison.
    types = [:a, nil, lambda {}, true, false, 10, 3.14, BIGNUM, Object.new]
    types.permutation(2).each do |left, right|
      define_method("test_types_#{left.class}_#{right.class}") do
        t = left | right
        assert_instance_of Table, t
        assert_equal [[left, right]], t.to_a
      end
    end

  end
end
