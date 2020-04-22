module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Online Marketplace App"

    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def flash_message_prefix(message_type)
    case message_type
      when "success"
      "Well done!"
      when "info"
      "Heads up!"
      when "warning"
      "Warning!"
      when "danger"
      "Oh snap!"
      else
      ""
    end
  end    
end
