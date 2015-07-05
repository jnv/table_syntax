# TableSyntax

[![Rubygems.org](https://img.shields.io/gem/v/table_syntax.svg?style=flat-square)](https://rubygems.org/gems/table_syntax)
[![Build Status](https://img.shields.io/travis/jnv/table_syntax.svg?style=flat-square)](https://travis-ci.org/jnv/table_syntax)
[![Code Climate](https://img.shields.io/codeclimate/github/jnv/table_syntax.svg?style=flat-square)](https://codeclimate.com/github/jnv/table_syntax)

TableSyntax was extracted from [RSpec::Parameterized](https://github.com/tomykaira/rspec-parameterized) by [@tomykaira](https://github.com/tomykaira).

It lets you build tables in plain Ruby with simple syntax, like:

```ruby
'value1' | 123     | 'lorem'
'value2' | 456     | 'ipsum'
:another | 'value' | [:dolor]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'table_syntax'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install table_syntax

## Usage

`TableSyntax` exposes method `.build`, which accepts column headers as arguments and block for table:

```ruby
require 'table_syntax'

table = TableSyntax.build(:col1, :col2) do
  'value1' | 'value2'
  :val3    | :val4
end
```

The resulting table can be iterated, where each row is available in a Struct:

```ruby
table.each do |row|
  row.col1 # => 'value1'; :val3
  row.col2 # => 'value2'; :val4
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [jnv/table_syntax](https://github.com/jnv/table_syntax). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

