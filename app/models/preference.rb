class Preference < ActiveRecord::Base
  validates_presence_of :plugin, :name, :value

  class << self
    def safe_pref_fetch(plugin_name, key)
      Preference.find_by(:plugin => plugin_name, :name => key).value rescue ""
    end

    def pref_has_keys?(plugin_name, keys)
      keys.each do |k|
        return false unless Preference.exists?(:plugin => plugin_name, :name => k)
      end
      return true
    end
  end
end
