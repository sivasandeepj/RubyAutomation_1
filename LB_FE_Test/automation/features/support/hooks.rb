require 'selenium-webdriver'
Before do |scenario|
  # path = File.dirname(__FILE__).gsub('features/support', 'driver/')
  # Selenium::WebDriver::Chrome.driver_path = path + 'chromedriver.exe'
  @browser = Watir::Browser.new :chrome
  @browser.cookies.clear
  @browser.window.maximize
  puts scenario
end

After do |scenario|
  @browser.close
end
