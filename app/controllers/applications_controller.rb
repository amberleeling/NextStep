class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = current_user.applications.includes(:job).order(date: :desc)
  end

  def new
    @application = Application.new
  end

  def create
    job = Job.create!(job_params)

    @application = current_user.applications.build(
      job: job,
      date: application_params[:date],
      status: "pending"
    )


      if @application.save
        redirect_to applications_path, notice: "Application submitted!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
      @application = Application.find(params[:id])
      if @application.update(application_params)
        redirect_to applications_path, notice: "Updated!"
      else
        render :index, status: :unprocessable_entity
      end
  end

  def destroy
  end

  private

    def application_params
      params.require(:application).permit(:date)
    end

    def job_params
      params.require(:application).permit(:company, :position, :description, :link)
    end

end
