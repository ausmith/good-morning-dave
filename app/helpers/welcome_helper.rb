require 'wunderground_client'

module WelcomeHelper
  def pref_has_keys?(plugin_name, keys)
    Preference.pref_has_keys?(plugin_name, keys)
  end

  def safe_pref_fetch(plugin_name, key)
    Preference.safe_pref_fetch(plugin_name, key)
  end

  def get_weather
    client = WundergroundClient.new
    return client.current, client.forecast
  end
end
