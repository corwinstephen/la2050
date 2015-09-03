module ApplicationHelper
  include AutoHtml

  def challenge_open?
    # Challenge Opens September 8th 2015 12noon PST
    open_at = DateTime.new(2015,9,8,12,00,00,"-08:00")
    # Challenge Closes October 6th 2015 12noon PST
    close_at = DateTime.new(2015,10,6,12,00,00,"-08:00")
    today = DateTime.now
    today.between? open_at, close_at
  end

  def voting_open?
    # Voting Opens October 20th 2015 12noon PST
    open_at = DateTime.new(2015,10,20,12,00,00,"-08:00")
    # Voting Closes November 3rd 2015 12noon PST
    close_at = DateTime.new(2015,11,3,12,00,00,"-08:00")
    today = DateTime.now
    today.between? open_at, close_at
  end

  # if today is after vote date show winners
  def winners_next?
    # Winners December 8th 2015 12noon PST
    vote_close_at = DateTime.new(2015,11,3,12,00,00,"-08:00")
    today = DateTime.now
    today > vote_close_at
  end

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
