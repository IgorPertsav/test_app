module ApplicationHelper
  def title
    if @title.nil?
      return "Ruby on Rails Tutorial Sample App"
    else
      return "Ruby on Rails Tutorial Sample App | " + @title
    end
  end
end
