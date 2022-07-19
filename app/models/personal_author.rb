class PersonalAuthor < ApplicationRecord
    belongs_to :author
    belongs_to :user

    # we may want something like this eventually. that'll be a tricky form. would love to help the user out with this via ajax calls, so they can only enter a couple fields before being presented with different book suggestions from APIs that match those two fields' values. and THEN be asked to fill in their personalbook attributes.
    # accepts_nested_attributes_for :authors, reject_if: :all_blank
end
