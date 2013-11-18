module ApplicationHelper

  def icon_submit_link(icon_name, link_text, link_class = "")
    icon_html =  content_tag('i','', :class=>"#{icon_name}") + "#{link_text}"
    link_to(icon_html, "#", :onclick=>"getForm(this).submit(); return false", :class=> link_class)
  end
end
