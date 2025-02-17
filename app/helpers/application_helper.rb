module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Prophet Ratings - NCAA Basketball Predictive Analytics"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end
  
  def sort_asc_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end
  
  def convert_date(old_date)
    if old_date
      return Date.strptime(old_date, '%m/%d/%Y')
    else
      return Date.strptime('01/01/2099', '%m/%d/%Y')
    end
  end
end
