class Author < ApplicationRecord
    has_many :personal_authors
    has_and_belongs_to_many :books
end
