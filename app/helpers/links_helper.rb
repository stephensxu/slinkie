module LinksHelper
  def link_visibility(link)
    link.private? ? "Private" : "Public"
  end
end
