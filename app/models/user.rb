class User < ApplicationRecord
  has_many :rounds
  # has_many :guesses, through: :rounds

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(plain_text_password)
    # @plain_text_password = plain_text_password
    @password = BCrypt::Password.create(plain_text_password)
    self.encrypted_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

  validates :username, :email, :encrypted_password, { :presence => true }
  validates :username, :email, { uniqueness: true }
end
