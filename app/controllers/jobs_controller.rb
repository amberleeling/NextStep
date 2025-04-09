class JobsController < ApplicationController
  def index
    @jobs = Job.all.where(system: true)

    if params[:query].present?
      @jobs = @jobs.where("position ILIKE :query OR company ILIKE :query", query: "%#{params[:query]}%")
    end
  end

  def show
  end
end
