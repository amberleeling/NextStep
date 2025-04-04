class CoverLettersController < ApplicationController
  def show
  end

  def create
    CoverLetterGeneratorJob.perform_later(params[:position], params[:company], params[:job_description], current_user.id)
  end
end
