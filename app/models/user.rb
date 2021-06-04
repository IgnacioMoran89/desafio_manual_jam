class User < ApplicationRecord
validates :name, presence: true
validates :email, confirmation: true
has_secure_password
end
