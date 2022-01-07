require "capybara"
require "capybara/cucumber"
require "faker"
require "rspec"
require "cpf_faker"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://plataforma.vobi.com.br/"
  config.default_max_wait_time = 10
end
