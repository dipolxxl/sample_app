module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    unless @title
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Logo image
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

end
