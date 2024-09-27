class Message < ApplicationRecord
  belongs_to :adventure, touch: true
  has_one :response
  after_create_commit :send_to_chat
  after_create_commit -> { broadcast_append_to adventure, target: "messages" }

  def send_to_chat
    Chat.send(message: self.id)
  end
end
