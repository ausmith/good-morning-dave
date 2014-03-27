class WelcomeController < ApplicationController
  def index
    @preferences = {}
    Preference.all.each do |pref|
      @preferences[pref.plugin] ||= {}
      @preferences[pref.plugin][pref.name] = pref.value
    end
  end
end
