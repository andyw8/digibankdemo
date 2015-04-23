RSpec.configure do |config|
  config.before(:each, js: true) { page.driver.block_unknown_urls }
end
