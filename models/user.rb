class User < ActiveRecord::Base
  include BCrypt
  has_many :judgements
  has_many :kittens, through: :judgements

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
