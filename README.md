# OrderOrder

Simple extensions to ActiveRecord for common 'order' queries

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'order_order'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install order_order

## Usage

This gem adds the following class methods to `ActiveRecord::Base`:

    ::chronological # Order records by date, with the newest records first.
    ::reverse_chronological # Order records by date, with the oldest records first.
    ::alphabetical # Order records alphabetically.
    ::reverse_alphabetical # Order records reverse alphabetically.

By default, the 'chronological' methods sort by the `created_at` column, and
the 'alphabetical' methods look for a column called `name` to sort by. To
override this, pass the column name to the methods:

    Post.alphabetical("title") # => ActiveRecord::Relation
    Comment.reverse_chronological("time") # => ActiveRecord::Relation
    
## Contributing

1. Fork it ( https://github.com/headstock/order_order/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
