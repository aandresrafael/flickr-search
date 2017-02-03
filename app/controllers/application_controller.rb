class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def per_page
    Rails.configuration.settings['per_page']
  end

  def cache_expire
    Rails.configuration.settings['cache_expiry'].minutes
  end

  def race_condition_ttl
    Rails.configuration.settings['cache_race_ttl'].minutes
  end
end
