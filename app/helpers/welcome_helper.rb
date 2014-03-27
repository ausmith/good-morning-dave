module WelcomeHelper
  def pref_has_keys?(plugin_name, keys)
    Preference.pref_has_keys?(plugin_name, keys)
  end

  def safe_pref_fetch(plugin_name, key)
    Preference.safe_pref_fetch(plugin_name, key)
  end
end
