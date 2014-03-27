class WundergroundClient
  def initialize
    @host = "api.wunderground.com"
    @plugin = "wunderground"
    Preference.pref_has_keys?(@plugin, ["api_key", "zip"])
  end

  def api_key
    Preference.safe_pref_fetch(@plugin, "api_key")
  end

  def zip
    Preference.safe_pref_fetch(@plugin, "zip")
  end

  def generate_path(category, query, params={}, format='json')
    params_str = params.collect {|k,v| "#{k}=#{CGI::escape(v.to_s)}"}.join("&")
    path = ["api", api_key, category, "q", "#{query}.#{format}"].join("/")
    return params_str.blank? ? "/#{path}" : "/#{path}?#{params_str}"
  end

  def forecast
    res = http_request(generate_path("forecast", zip))
    fc_data = res.fetch("forecast", {}).fetch("txt_forecast", {}).fetch(
      "forecastday", [])
    fc_data.collect do |fc|
      ["title", "fcttext", "icon_url"].collect do |k|
        fc.fetch(k, "")
      end
    end
  end

  def current
    conditions = http_request(generate_path("conditions", zip))
    curr_obs = conditions.fetch("current_observation", {})
    ["temperature_string", "wind_string", "icon_url"].collect do |k|
      curr_obs.fetch(k, "")
    end
  end

  def http_request(path)
    req = Net::HTTP::Get.new(path)
    req['Accept'] = 'application/json'
    Net::HTTP.start(@host, 80) do |http|
      res = http.request(req)
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body) unless res.body.blank?
      else
        return nil
      end
    end
  end
end
