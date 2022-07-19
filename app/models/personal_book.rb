class PersonalBook < ApplicationRecord
    # recording this as a hash and not an array in case we decide to add to this enum down the line
    enum :reading_status, { unread: 0, mid_read: 1, read: 2 }

    belongs_to :book
    belongs_to :user
    
    # we may want something like this eventually. that'll be a tricky form. would love to help the user out with this via ajax calls, so they can only enter a couple fields before being presented with different book suggestions from APIs that match those two fields' values. and THEN be asked to fill in their personalbook attributes.
    # accepts_nested_attributes_for :books, reject_if: :all_blank
end
