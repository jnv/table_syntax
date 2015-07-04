# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'table_syntax/version'

Gem::Specification.new do |spec|
  spec.name          = "table_syntax"
  spec.version       = TableSyntax::VERSION
  spec.authors       = ["Jan Vlnas", "tomykaira"]
  spec.email         = ["rubygems@jan.vlnas.cz"]

  spec.summary       = %q{Create hashes comfortably from data tables in Ruby.}
  spec.description   = %q{Use TableSyntax to create and parse data tables directly in Ruby code. Extracted from tomykaira's [RSpec::Parameterized](https://rubygems.org/gems/rspec-parameterized).}
  spec.homepage      = "https://github.com/jnv/table_syntax"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "binding_of_caller"
  spec.add_dependency "parser"
  spec.add_dependency "unparser"
  spec.add_dependency "proc_to_ast"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
end
