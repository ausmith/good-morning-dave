ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
end

VCR::configure do |c|
  c.cassette_library_dir = Rails.root.join('test', 'support', 'vcr').to_s
  c.hook_into :webmock
  c.default_cassette_options = {
    # change when adding new tests
    :record => :none,
    :update_content_length_header => true,
    :match_requests_on => [:method, :uri, :body],
  }
end
