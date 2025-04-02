class DashboardsController < ApplicationController
  def show
    applications = current_user.applications

    total = applications.count.to_f
    @pending_percentage = ((applications.where(status: "pending").count / total) * 100).round rescue 0
    @rejected_percentage = ((applications.where(status: "rejected").count / total) * 100).round rescue 0
    @accepted_percentage = ((applications.where(status: "accepted").count / total) * 100).round rescue 0
  end


  private

  def percentage(count, total)
    return 0 if total == 0
    ((count / total) * 100).round
  end
end
