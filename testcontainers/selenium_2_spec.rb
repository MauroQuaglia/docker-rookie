require 'testcontainers/selenium'
require "selenium-webdriver"

describe 'Selenium' do
  before do
    @selenium_container = Testcontainers::SeleniumContainer.new(
      "selenium/standalone-firefox:116.0",
      capabilities: :firefox,
      vnc_no_password: true)
    @selenium_container.start
  end


  it 'test' do
    # Il WebDriver è il ponte tra il codice di test e il browser (Firefox, in questo caso). Si occupa di inviare comandi per navigare, cliccare, prendere screenshot e altro.
    # Il driver che sfrutta il container.
    # In questo caso, il container ospita un'istanza di un browser (come Firefox), ma il driver Selenium esegue il codice fuori dal container, controllando e interagendo con il browser all'interno del container.
    # Il container esegue il browser, mentre Selenium WebDriver agisce come una "scatola nera" che invia comandi al browser nel container tramite una connessione URL.
    driver = Selenium::WebDriver.for(
      :remote,
      url: @selenium_container.selenium_url,
      options: Selenium::WebDriver::Options.firefox
    )

    driver.navigate.to("https://google.it/")
    driver.save_screenshot("screenshot.png")
  end

  after do
    @selenium_container.stop if @selenium_container
  end

end