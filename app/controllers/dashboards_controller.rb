class DashboardsController < ApplicationController
  def show
    applications = current_user.applications

    @total_applications = applications.count

    total = applications.count
    @pending_percentage = total > 0 ? ((applications.where(status: "pending").count.to_f / total) * 100).round : 0
    @rejected_percentage = total > 0 ? ((applications.where(status: "rejected").count.to_f / total) * 100).round : 0
    @accepted_percentage = total > 0 ? ((applications.where(status: "accepted").count.to_f / total) * 100).round : 0

    # 本月 vs 上月
    current_month = Time.zone.today.beginning_of_month
    last_month = current_month - 1.month

    current_month_apps = applications.where(date: current_month..Time.zone.today)
    last_month_apps = applications.where(date: last_month.beginning_of_month..last_month.end_of_month)

    current_month_count = current_month_apps.count
    last_month_count = last_month_apps.count

    @monthly_change = if last_month_count > 0
      (((current_month_count - last_month_count).to_f / last_month_count) * 100).round
    else
      0
    end

    # 本週 vs 上週
    current_week = Time.zone.today.beginning_of_week
    last_week = current_week - 1.week

    current_week_apps = applications.where(date: current_week..Time.zone.today)
    last_week_apps = applications.where(date: last_week.beginning_of_week..last_week.end_of_week)

    current_week_count = current_week_apps.count
    last_week_count = last_week_apps.count

    @weekly_change = if last_week_count > 0
      (((current_week_count - last_week_count).to_f / last_week_count) * 100).round
    else
      0
    end

    @monthly_applications = current_month_apps
      .group_by { |app| app.created_at.beginning_of_day }
      .transform_values(&:count)

    @weekly_applications = current_week_apps
      .group_by { |app| app.created_at.beginning_of_day }
      .transform_values(&:count)

    @applications_by_position = applications
      .joins(:job)
      .group('jobs.position')
      .count
  end
end

  private

  def percentage(count, total)
    return 0 if total == 0
    ((count / total) * 100).round
  end
