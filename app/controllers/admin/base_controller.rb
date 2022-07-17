class Admin::BaseController < ApplicationController
  before_action :check_admin

  layout 'admin/layouts/application'

  private

  def not_authenticated
    flash[:warting] = t('defaults.message.require_login')
    redirect_to admin_login_path
  end

  # ユーザーが管理者権限を持たない場合トップページにリダイレクトさせる
  def check_admin
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end
end
