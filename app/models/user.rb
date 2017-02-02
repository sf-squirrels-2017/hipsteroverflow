class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = hashed_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def validate_password
    errors.add(:password, "is required") if @raw_password.nil?
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.hashed_password == password
      @user
    else
      nil
    end
  end

end
