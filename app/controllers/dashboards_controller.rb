class DashboardsController < AuthorizedController
  def show
    @dashboard = Dashboard.new(account)
  end

  private

  def account
    current_user.account
  end
end
