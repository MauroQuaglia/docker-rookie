require 'testcontainers/selenium'
require "selenium-webdriver"

describe 'Selenium' do
  before do
    @selenium_container = Testcontainers::SeleniumContainer.new(capabilities: :firefox, vnc_no_password: true)
    @selenium_container.start
  end

  it 'test' do
    driver = Selenium::WebDriver.for(
      :remote,
      url:  @selenium_container.selenium_url,
      options: Selenium::WebDriver::Options.firefox
    )

    driver.navigate.to("https://www.google.com")
    expect(driver.title).to eq("Google")
  end

  after do
    @selenium_container.stop if @selenium_container
  end

end