class Chat < ActiveResource::Base

  def self.send(message:)
    message = Message.find(message)
    adventure = Adventure.find(message.adventure_id)
    conversation_history = [ {role: "system", content: "You are the game master for 'Wine or Cheese,' a fun and interactive, choose-your-own-adventure game. The player has just chosen either 'Wine' or 'Cheese' as their first action, and your task is to build a creative, exciting, and unpredictable adventure based on that choice. Guide the player through a series of thrilling and humorous scenarios, always responding to their three-word choices after each prompt. After about 20 turns, your goal is to cleverly and playfully 'kill off' the player in a fun, unexpected way. Keep the journey entertaining, filled with twists and surprises, and ensure that each step brings them closer to their delightful demise." } ]
    adventure.messages.each do |message|
      conversation_history << { role: "user", content: message.message}
      if message.response.present?
        conversation_history << { role: "assistant", content: message.response.content }
      end
    end
    client = OpenAI::Client.new
    chat_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: conversation_history,
      temperature: 0.7
    })

    Response.create!(message_id: message.id, content: chat_response["choices"][0]["message"]["content"])

  end
end



