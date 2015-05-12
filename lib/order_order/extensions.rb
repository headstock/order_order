# Extension for ActiveRecord::Base which adds some common sorting options.
#
# WARNING: **Never** allow allow user-generated input to be passed in as the
# values of these methods! It would leave you wide open to SQL injection.
module OrderOrder
  module Extensions

    DEFAULT_ALPHABETICAL_COLUMN  = :name
    DEFAULT_CHRONOLOGICAL_COLUMN = :created_at

    # Order records by date, with the newest records first.
    #
    # @param column [String] the name of the column which represents the object's
    # date. Defaults to `created_at`
    def chronological(column=DEFAULT_CHRONOLOGICAL_COLUMN)
      order("#{column} ASC")
    end

    # Order records by date, with the oldest records first.
    #
    # @param column [String] the name of the column which represents the object's
    # date. Defaults to `created_at`
    def reverse_chronological(column=DEFAULT_CHRONOLOGICAL_COLUMN)
      order("#{column} DESC")
    end

    # Order records alphabetically.
    #
    # @param column_or_options [String] the name of the column which represents the object's
    #   name, or a hash of options. Defaults to `"name"`.
    #
    # @option case_sensitive [Boolean] order case-sensitively, e.g. "C" will go
    #   before "b". True by default
    def alphabetical(column_or_options=DEFAULT_ALPHABETICAL_COLUMN, options={})
      column = get_alphabetical_column(column_or_options, options)
      order("#{column} ASC")
    end

    # Order records alphabetically.
    #
    # @param column_or_options [String] the name of the column which represents the object's
    #   name, or a hash of options. Defaults to `"name"`.
    #
    # @option case_sensitive [Boolean] order case-sensitively, e.g. "C" will go
    #   after "b". True by default
    def reverse_alphabetical(column_or_options=DEFAULT_ALPHABETICAL_COLUMN, options={})
      column = get_alphabetical_column(column_or_options, options)
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


    private

    def get_alphabetical_column(column_or_options, options)
      if column_or_options.is_a?(Hash)
        options = column_or_options
        column  = DEFAULT_ALPHABETICAL_COLUMN
      else
        column  = column_or_options
      end

      column = "lower(#{column})" if !options.fetch(:case_sensitive, true)
      column
    end
  end
end

ActiveRecord::Base.send(:extend, OrderOrder::Extensions)
