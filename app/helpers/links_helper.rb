module LinksHelper
  def link_visibility(link)
    link.private? ? "Private" : "Public"
  end

  def privacy_switch(link)
    link.private? ? "false" : "true"
  end
end
