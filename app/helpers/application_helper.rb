module ApplicationHelper
  def check_disabled(item)
    item.nil? ? true : false
  end
end
