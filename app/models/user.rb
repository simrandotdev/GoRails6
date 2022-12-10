# email: string
# password_digest:string
# password: string `virtual attribute`
# password_confirmation: string `virtual attribute`
class User < ApplicationRecord
  # These are virtual attributes that won't get saved to the database
  # but when we submit a password it will run through bcrypt
  # and hash that password.
  has_secure_password
end
