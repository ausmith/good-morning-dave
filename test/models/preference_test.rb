require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  test "validation" do
    pref = Preference.new
    assert pref.invalid?
    pref.plugin = "a"
    assert pref.invalid?
    pref.name = "b"
    pref.value = "c"
    assert pref.valid?
  end
end
