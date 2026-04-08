require 'testcontainers/selenium'
require "selenium-webdriver"

describe 'Selenium' do
  before do
    @selenium_container = Testcontainers::SeleniumContainer.new(
      "selenium/standalone-chrome:129.0-20250505",
      capabilities: :chrome,
      vnc_no_password: true
    )
    @selenium_container.start
    @selenium_container.exec(
      ['sh', '-c', 'echo "10.45.0.1 miosito" >> /etc/hosts'],
      user: "root"
    )
  end

  it 'test' do
    driver = Selenium::WebDriver.for(
      :remote,
      url: @selenium_container.selenium_url,
      options: Selenium::WebDriver::Options.chrome
    )

    driver.navigate.to("http://miosito/url")
    driver.save_screenshot("#{Dir.pwd}/testcontainers/screenshots/test-4.png")
  end

  after do
    @selenium_container.stop if @selenium_container
  end

end