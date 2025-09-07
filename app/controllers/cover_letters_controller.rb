class CoverLettersController < ApplicationController
  def show
    if params[:id].present?
      @job = Job.find(params[:id])
    end
  end

  def create
    position = params[:position]
    company = params[:company]
    job_description = params[:job_description]
    user_id = current_user.id

    # Broadcast skeleton immediately
    Turbo::StreamsChannel.broadcast_update_to(
      "user_#{user_id}_cover_letter_form",
      target: "cover_letter_form",
      partial: "cover_letters/skeleton"
    )

    instructions = <<~TEXT
      I'm applying to a #{position} position at #{company}
      and I need you to generate a cover letter for me. Here is the
      job description: #{job_description}

      Maximum length should be 200 words. The form should have some spaces
      between the introduction and the body of the letter.
    TEXT

    content = ""
    
    RubyLLM.chat.with_instructions(instructions).ask("Generate a cover letter") do |chunk|
      next if chunk.content.blank? # skip empty chunks
      
      content += chunk.content
      Turbo::StreamsChannel.broadcast_update_to(
        "user_#{user_id}_cover_letter_form",
        target: "cover_letter_form",
        partial: "cover_letters/cover_letter",
        locals: { content: content }
      )
    end
  end

end
