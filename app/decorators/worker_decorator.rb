class WorkerDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all
  decorates_association :schedules

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def available_time_link(day)
    schedule = worker.schedules_on(day)
    if schedule.blank?
      'ー'
    else
      h.link_to schedule.available_time_range_text, mng_worker_schedule_arrange_path(object, schedule)
    end
  end
end
