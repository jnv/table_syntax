#
# Based on RSpec::Parameterized::Table::Row from https://github.com/tomykaira/rspec-parameterized
# Copyright 2012-2015 tomykaira
#
module TableSyntax
  class Row
    def initialize(param)
      @params = [param]
    end

    def add_param(param)
      @params << param
    end
    alias :<< :add_param

    def to_a
      @params
    end

    def to_params
      [@params]
    end
  end
end
