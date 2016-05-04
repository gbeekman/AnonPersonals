class User < ActiveRecord::Base
  acts_as_messageable
  validates :email, :username, :session_token, :password_digest, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  after_initialize :ensure_session_token

  has_many(
  :personals,
  class_name: "Personal",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(
  :sent_messages,
  class_name: "Message",
  foreign_key: :sender_id,
  primary_key: :id
  )

  has_many(
  :received_messages,
  class_name: "Message",
  foreign_key: :receiver_id,
  primary_key: :id
  )

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
