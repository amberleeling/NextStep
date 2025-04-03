class OnboardingController < ApplicationController
  def index
    redirect_to applications_path if current_user&.completed_onboarding?
  end
end
