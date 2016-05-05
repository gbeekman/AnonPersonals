class Message < ActiveRecord::Base
  validates :body, :sender_id, :receiver_id, :personals_id, presence: true

  belongs_to(
  :sender,
  class_name: "User",
  foreign_key: :sender_id,
  primary_key: :id
  )

  belongs_to(
  :receiver,
  class_name: "User",
  foreign_key: :receiver_id,
  primary_key: :id
  )

  belongs_to(
  :personal,
  class_name: "Personal",
  foreign_key: :personals_id,
  primary_key: :id
  )
end
