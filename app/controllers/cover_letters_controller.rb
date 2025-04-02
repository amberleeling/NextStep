class CoverLettersController < ApplicationController
  def show
  end

  def create
    prompt = <<~TEXT
      I'm applying to a #{params[:position]} position at #{params[:company]}
      and I need you to generate a cover letter for me. Here is the
      job description: #{params[:job_description]}

      Maximum length should be 200 words.
    TEXT

    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}]
    })

    @cover_letter = response["choices"][0]["message"]["content"]
  end
end
