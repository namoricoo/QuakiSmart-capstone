# ApplicationHelper
module ApplicationHelper
  # Return the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'QuakiSmart'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Return the full title on a per-page basis.
  def full_title_base_text(base_text, page_title)
    base_title = base_text
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def set_nav_class(activity_status)    
    base_status = 'default'    
    if activity_status.empty?
      base_status   
    else      
      activity_status
    end 
  end
end
