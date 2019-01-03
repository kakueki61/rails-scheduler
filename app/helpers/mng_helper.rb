module MngHelper
  def logged_in?
    !current_worker.nil?
  end

  def current_staff_account
    current_staff.email
  end
end
