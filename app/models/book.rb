class Book < ApplicationRecord
    has_many :personal_books
    has_and_belongs_to_many :authors
end
