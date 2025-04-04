class CoverLetterGeneratorJob < ApplicationJob
  queue_as :default

  def perform(position, company, job_description, user_id)
    prompt = <<~TEXT
      I'm applying to a #{position} position at #{company}
      and I need you to generate a cover letter for me. Here is the
      job description: #{job_description}

      Maximum length should be 200 words. The form should have some spaces
      between the introduction and the body of the letter.
    TEXT

    content = ""
    client = OpenAI::Client.new
    client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        stream: stream_proc(user_id, content)
      }
    )
  end

  private

  def stream_proc(user_id, content)
    proc do |chunk, _bytesize|
      new_content = chunk.dig("choices", 0, "delta", "content")
      if new_content
        content += new_content
        Turbo::StreamsChannel.broadcast_update_to(
          "user_#{user_id}_cover_letter_form",
          target: "cover_letter_form",
          partial: "cover_letters/cover_letter",
          locals: { content: content }
        )
      end
    end
  end
end
