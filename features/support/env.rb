require 'rspec'
require 'capybara'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'selenium-webdriver'
require 'webshot'


$browser = (ENV['BROWSER'] || 'chrome')
puts 'Programa executado no browser ' + $browser
# Configurando o driver capybara
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :"#{$browser}")
end

# Configurando o driver capybara
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end

# Setando a configuração do driver como padrão
Capybara.default_driver = :selenium
#Capybara.default_driver = :selenium_chrome_headless

# timeout
Capybara.default_max_wait_time = 6

# $wait = Selenium::WebDriver::Wait.new(:timeout => 20)

# Maximizar a tela ao iniciar o teste
Capybara.page.driver.browser.manage.window.maximize
