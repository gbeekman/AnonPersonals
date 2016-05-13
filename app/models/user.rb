class User < ActiveRecord::Base
  after_initialize :ensure_session_token
  before_create :randomize_id
  validates :email, :username, :session_token, :password_digest, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password


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

  has_many(
  :conversations,
  class_name: "Conversation",
  foreign_key: :recipient_id,
  primary_key: :id
  )


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

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?

  end

end
