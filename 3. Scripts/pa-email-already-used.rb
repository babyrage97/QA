require 'selenium-webdriver'
require 'rspec'

# Test fir registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'Confirm user already used this email address' do
      driver = Selenium::WebDriver.for :firefox
      # Go to sing-in form
      driver.navigate.to 'https://www.polovniautomobili.com/registracija'

      # Fill out form
      email_field = driver.find_element(id: 'email')
      email_field.send_keys("test@test.me")

      password_field = driver.find_element(id: 'password_first')
      password_field.click
      
      sleep 1

      # Confirm user already used this email address
      wrong_email = driver.find_element(id: "register_email_error")
      wrong_emailtext = wrong_email.text
      expect(wrong_emailtext).to eq("Uneta E-mail adresa je već zauzeta")
      
      driver.quit

    end
  end
end
