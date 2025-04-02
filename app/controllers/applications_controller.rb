class ApplicationsController < ApplicationController
  before_action :set_application, only: [:edit, :update, :destroy]

  def index
    @applications = current_user.applications.includes(:job).order(date: :desc)
  end

  def new
    @application = Application.new
    @application.build_job
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user

    if @application.save
      redirect_to applications_path, notice: "Application submitted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @application.update(application_params)
      redirect_to applications_path, notice: "Updated!"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @application.destroy
    redirect_to applications_path, notice: "Application deleted!"
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:date, :status, job_attributes: [:company, :position, :description, :link])
  end
end
