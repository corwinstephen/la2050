module ApplicationHelper
  def display_subnav?
    request.original_fullpath == '/blog' ||
      @cms_page.present? && ['about', 'blog'].include?(@cms_page.slug)
  end
end
