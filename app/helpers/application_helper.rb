module ApplicationHelper

  #include SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

  def title
    if @title.nil?
      return "Ruby on Rails Tutorial Sample App"
    else
      return "Ruby on Rails Tutorial Sample App | " + @title
    end
  end
end
