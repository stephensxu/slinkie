module LinksHelper
  def link_visibility(link)
    link.private? ? "Private" : "Public"
  end

  def privacy_switch(link)
    link.private? ? "false" : "true"
  end

  def link_display_nickname(link)
    link_to(link_url(link), link)
  end
end
