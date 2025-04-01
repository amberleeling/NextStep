class ApplicationController < ActionController::Base
  # 放全域共用邏輯（例如 current_user、before_action 等）
  before_action :authenticate_user!
end
