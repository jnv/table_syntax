#
# Based on RSpec::Parameterized::TableSyntax from https://github.com/tomykaira/rspec-parameterized
# Copyright 2012-2015 tomykaira
#
require 'binding_of_caller'
require 'table_syntax/table'
require 'table_syntax/row'

module TableSyntax
  module PipeImpl
    def |(other)
      where_binding = binding.of_caller(1)          # get where block binding
      caller_instance = eval("self", where_binding) # get caller instance (ExampleGroup)

      if caller_instance.instance_variable_defined?(:@__parameter_table)
        table = caller_instance.instance_variable_get(:@__parameter_table)
      else
        table = Table.new
        caller_instance.instance_variable_set(:@__parameter_table, table)
      end

      row = Row.new(self)
      table.add_row(row)
      row.add_param(other)
      table
    end
  end

  module Pipe
    [Object, Fixnum, Bignum, Array, NilClass, TrueClass, FalseClass].each do |klass|
      refine klass do
        include PipeImpl
      end
    end
  end
end
