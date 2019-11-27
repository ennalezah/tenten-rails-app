class User < ApplicationRecord
  has_secure_password
  has_many :posts

  before_validation :make_titlecase, :make_downcase

  validates :name,
    presence: { message: "Name cannot be left blank." },
    format: { with: /\A[a-zA-Z\s]+\z/, message: "Name can only contain letters." },
    length: { minimum: 2, message: "Name must have at least 2 characters." }

  validates :email,
    presence: { message: "Email cannot be left blank." },
    uniqueness: { case_sensitive: false, message: "An account has already been created with that email address. Please login instead." }

  validates :username,
    presence: { message: "Username cannot be left blank." },
    length: { minimum: 4, message: "Username must have at least 4 characters." },
    format: { with: /\A[\w]+\z/, message: "Username can only contain letters, numbers, and underscores." },
    uniqueness: { case_sensitive: false, message: "That username is already taken. Please enter a new one." }

  validates :password,
    presence: { message: "Password cannot be left blank." },
    length: { in: 6..20, message: "Password must be between 6-20 characters long." }

    private

    def make_titlecase
      self.name = name.titlecase
    end

    def make_downcase
      self.email = email.downcase
      self.username = username.downcase
    end
end
