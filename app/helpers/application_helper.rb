module ApplicationHelper
  def display_about_nav?
    request.original_fullpath == '/blog' ||
      @cms_page.present? && ['about', 'press', 'instagram', 'team', 'contact'].include?(@cms_page.slug)
  end

  def display_dashboard_nav?
    @cms_page.present? && ['goals', 'live', 'play', 'learn', 'connect', 'create', 'metrics', 'datasets', 'reports', 'dashboard'].include?(@cms_page.slug)
  end

  def display_subnav?
    display_about_nav? || display_dashboard_nav?
  end
end
