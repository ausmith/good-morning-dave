require 'test_helper'
require 'wunderground_client'

class WundergroundClientTest < ActiveSupport::TestCase
  def setup
    @client = WundergroundClient.new
    Preference.create! plugin: "wunderground", name: "api_key", value: "abc"
    Preference.create! plugin: "wunderground", name: "zip", value: "00000"
  end

  def test_current
    assert_client_with_vcr("current",
                           ["32.4 F (0.2 C)", "Calm",
                            "http://icons-ak.wxug.com/i/c/k/nt_clear.gif"])
  end

  def test_forecast
    assert_client_with_vcr("forecast",
                           [["Thursday",
                             "Partly cloudy. High of 63F. Winds from the SE at 5 to 10 mph.",
                             "http://icons-ak.wxug.com/i/c/k/partlycloudy.gif"],
                            ["Thursday Night",
                             "Mostly cloudy in the evening, then overcast with a chance of a thunderstorm and rain showers. Low of 50F. Winds from the SSE at 5 to 10 mph. Chance of rain 60%.",
                             "http://icons-ak.wxug.com/i/c/k/chancetstorms.gif"],
                            ["Friday",
                             "Overcast with a chance of a thunderstorm and rain showers. High of 64F. Winds from the SSE at 5 to 10 mph. Chance of rain 70% with rainfall amounts near 0.6 in. possible.",
                             "http://icons-ak.wxug.com/i/c/k/chancetstorms.gif"],
                            ["Friday Night",
                             "Overcast with a chance of a thunderstorm and rain showers. Fog overnight. Low of 55F. Winds from the South at 5 to 10 mph. Chance of rain 70% with rainfall amounts near 0.4 in. possible.",
                             "http://icons-ak.wxug.com/i/c/k/chancetstorms.gif"],
                            ["Saturday",
                             "Overcast with a chance of a thunderstorm and rain showers. High of 73F. Winds from the SW at 5 to 15 mph shifting to the West in the afternoon. Chance of rain 60% with rainfall amounts near 0.2 in. possible.",
                             "http://icons-ak.wxug.com/i/c/k/chancetstorms.gif"],
                            ["Saturday Night",
                             "Partly cloudy in the evening, then clear. Low of 39F. Breezy. Winds from the NW at 10 to 20 mph.",
                             "http://icons-ak.wxug.com/i/c/k/partlycloudy.gif"],
                            ["Sunday",
                             "Clear. High of 68F. Winds from the NNW at 5 to 15 mph.",
                             "http://icons-ak.wxug.com/i/c/k/clear.gif"],
                            ["Sunday Night",
                             "Clear. Low of 41F. Winds from the NNE at 5 to 10 mph shifting to the East after midnight.",
                             "http://icons-ak.wxug.com/i/c/k/clear.gif"]])
  end

  def assert_client_with_vcr(client_method, expected)
    VCR::use_cassette("wunderground_client_#{client_method}") do
      res = @client.send(client_method)
      assert_equal expected, res, client_method
    end
  end
end
