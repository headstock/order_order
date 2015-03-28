# Extension for ActiveRecord::Base which adds some common sorting options.
#
# WARNING: **Never** allow allow user-generated input to be passed in as the
# values of these methods! It would leave you wide open to SQL injection.
module OrderOrder
  module Extensions

    # Order records by date, with the newest records first.
    #
    # @param column [String] the name of the column which represents the object's
    # date. Defaults to `created_at`
    def chronological(column=:created_at)
      order("#{column} ASC")
    end

    # Order records by date, with the oldest records first.
    #
    # @param column [String] the name of the column which represents the object's
    # date. Defaults to `created_at`
    def reverse_chronological(column=:created_at)
      order("#{column} DESC")
    end

    # Order records alphabetically.
    #
    # @param column [String] the name of the column which represents the object's
    #   name. Defaults to `name`
    def alphabetical(column=:name)
      order("#{column} ASC")
    end

    # Order records reverse alphabetically.
    #
    # @param column [String] the name of the column which represents the object's
    #   name. Defaults to `name`
    def reverse_alphabetical(column=:name)
      order("#{column} DESC")
    end

    # TODO A potential way to improve this: setting `self.chronological_column`
    # or `self.name_column` at the model level would negate the need to pass an
    # argument to these methods.


    # Return all records created SINCE the provided date
    #
    # @param [Time]
    # @return [ActiveRecord::Relation]
    def since(time)
      where("created_at > ?", time)
    end
  end
end

ActiveRecord::Base.send(:extend, OrderOrder::Extensions)
