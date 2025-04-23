class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  private

  def require_admin!
    unless current_user&.admin?
      redirect_to authenticated_root_path, alert: "คุณไม่มีสิทธิ์เข้าถึงหน้านี้"
    end
  end
end
