module ApplicationHelper
  include AutoHtml
  
  def display_about_nav?
    request.original_fullpath == '/blog' ||
      @cms_page.present? && ['about', 'press', 'instagram', 'community'].include?(@cms_page.slug)
  end

  def display_dashboard_nav?
    (@cms_page.present? && ['goals', 'live', 'play', 'learn', 'connect', 'create', 'metrics', 'datasets', 'reports', 'dashboard'].include?(@cms_page.slug)) ||
      controller.controller_name == 'metrics'
  end

  def display_challenge_nav?
    (@cms_page.present? && ['challenge', 'la2050listens', 'grantees'].include?(@cms_page.slug))
  end

  def display_subnav?
    display_about_nav? || display_dashboard_nav? || display_challenge_nav?
  end

end
