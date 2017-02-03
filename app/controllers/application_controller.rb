class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def per_page
    Rails.configuration.settings['max_results']
  end

  def cache_expire
    Rails.configuration.settings['cache_expiry'].minutes
  end

  def race_condition_ttl
    Rails.configuration.settings['max_results'].minutes
  end
end
