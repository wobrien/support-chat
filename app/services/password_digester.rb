require 'bcrypt'

class PasswordDigester
  def self.digest(plain_password)
    BCrypt::Password.create(plain_password, cost: cost).to_s
  end

  def self.cost
    ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  end

  def self.compare(digest, plain_password)
    BCrypt::Password.new(digest) == plain_password
  end
end