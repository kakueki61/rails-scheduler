class WorkersController < ApplicationController
  before_action :authenticate_staff!

  def index
    @workers = current_staff.shop.workers
    @day = Time.zone.today
  end

  def show
  end

  def arrange
  end

  def determine
  end
end
