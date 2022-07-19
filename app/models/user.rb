class User < ApplicationRecord
    # adds virtual attributes for authentication
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    has_many :personal_authors
    has_many :personal_books
end
