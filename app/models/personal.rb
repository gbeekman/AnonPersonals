class Personal < ActiveRecord::Base
  validates :title, :body, :user_id, :gender, :age, presence: true


  belongs_to(
  :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )
end
