if ENV.fetch("COVERAGE", false)
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "webmock/rspec"

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true, allow: ["codeclimate.com"])
