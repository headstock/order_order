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

There is also a finder method called `since`:

    user_0 = User.create(created_at: 5.days.ago)
    user_1 = User.create(created_at: 3.days.ago)
    user_2 = User.create(created_at: 2.days.ago)

    new_users = User.since(4.days.ago)

    new_users.include?(user_0) # => false
    new_users.include?(user_1) # => true
    new_users.include?(user_2) # => true

`.alphabetical` and `.reverse_alphabetical` take an optional parameter 'case_sensitive'
(true by default):

    person_1 = Person.create(name: "Steve")
    person_2 = Person.create(name: "Bill")
    person_3 = Person.create(name: "dave")

    puts Post.alphabetical.pluck(:name)
    # => Bill
    # => Steve
    # => dave
    puts Post.alphabetical.pluck(:name, case_sensitive: false)
    # => Bill
    # => dave
    # => Steve

Note that `case_sensitive` has only been tested on PostgreSQL. Feel free to add
it for one of the other SQL adapters if you need it.

    
## Contributing

1. Fork it ( https://github.com/headstock/order_order/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
