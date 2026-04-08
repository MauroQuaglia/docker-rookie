require 'testcontainers/selenium'
require "selenium-webdriver"

describe 'Selenium' do
  before do
    @selenium_container = Testcontainers::SeleniumContainer.new(
      "selenium/standalone-chrome:100.0.4896.75-chromedriver-100.0.4896.60",
      capabilities: :chrome,
      vnc_no_password: true)
    @selenium_container.start
  end


  it 'test' do
    driver = Selenium::WebDriver.for(
      :remote,
      url: @selenium_container.selenium_url,
      options: Selenium::WebDriver::Options.chrome
    )

    driver.navigate.to("https://google.it/")
    driver.save_screenshot("screenshot.png")
  end

  after do
    @selenium_container.stop if @selenium_container
  end

end