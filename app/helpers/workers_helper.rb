module WorkersHelper
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_worker.nil?
  end
end
