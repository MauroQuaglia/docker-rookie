require 'testcontainers/selenium'
require "selenium-webdriver"

describe 'Selenium' do
  before do
    @selenium_container = Testcontainers::SeleniumContainer.new(capabilities: :firefox, vnc_no_password: true)
    @selenium_container.start
  end

  it 'test' do
    puts @selenium_container.inspect

    driver = Selenium::WebDriver.for(:remote,
                                     url: @selenium_container.selenium_url

    )

    #driver = Selenium::WebDriver.for(:firefox, :url => @selenium_container.selenium_url)
    driver.navigate.to("https://www.google.com")
    driver.screenshot

    expect(driver.title).to eq("Google")
  end

  after do
     @selenium_container.stop if @selenium_container
  end

end