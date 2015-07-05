#
# Based on RSpec::Parameterized::ExampleGroupMethods from https://github.com/tomykaira/rspec-parameterized
# Copyright 2012-2015 tomykaira
#
require 'parser'
require 'unparser'
require 'proc_to_ast'

module TableSyntax
  class TableParser
    def separate_table_like_block(b)
      ast = b.to_ast
      inner_ast = ast.children[2]
      if inner_ast.type == :send
        lines = [inner_ast]
      else
        lines = inner_ast.children
      end

      lines.map do |node|
        if node.type == :send
          buf = []
          extract_value(node, buf)
          buf.reverse
        end
      end
    end

    def extract_value(node, buf)
      receiver, method, arg = node.children

      if method == :|
        buf << eval_source_fragment(Unparser.unparse(arg))
      end

      if receiver.is_a?(AST::Node) && receiver.type == :send && receiver.children[1] == :|
        extract_value(receiver, buf)
      else
        buf << eval_source_fragment(Unparser.unparse(receiver))
      end
    end

    def eval_source_fragment(source_fragment)
      instance = new  # for evaluate let methods.
      if defined?(self.superclass::LetDefinitions)
        instance.extend self.superclass::LetDefinitions
      end
      instance.instance_eval(source_fragment)
    end
  end
end
