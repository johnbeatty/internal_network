module ApplicationHelper
  def active_menu_header_link(option)
    if content_for(:menu_header_link) == option
      "border-indigo-500 text-gray-900"
    else
      "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700"
    end
  end
end
