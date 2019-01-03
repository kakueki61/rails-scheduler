module ApplicationHelper
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "スケジュール管理"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def hour_options
    options = {}
    24.times do |i|
      options["%02d" % i] = i
    end
    options
  end

  def min_options
    [["00", 0], ["15", 15], ["30", 30], ["45", 45]]
  end
end
