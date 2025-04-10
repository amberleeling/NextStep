class CoverLettersController < ApplicationController
  def show
    if params[:id].present?
      @job = Job.find(params[:id])
    end
  end

  def create
    CoverLetterGeneratorJob.perform_later(params[:position], params[:company], params[:job_description], current_user.id)
  end
end
