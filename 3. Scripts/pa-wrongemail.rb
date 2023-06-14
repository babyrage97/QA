require 'selenium-webdriver'
require 'rspec'

# Test fir registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'Confirm user used wrong email address' do
      driver = Selenium::WebDriver.for :firefox
      # Go to sing-in form
      driver.navigate.to 'https://www.polovniautomobili.com/registracija'

      # Fill out form
      email_field = driver.find_element(id: 'email')
      email_field.send_keys("testtest.me")

      password_field = driver.find_element(id: 'password_first')
      password_field.send_keys('Testic123')

      password2_field = driver.find_element(id: 'password_second')
      password2_field.send_keys('Testic123')

      # Accept rules
      tos_box = driver.find_element(id: 'tos')
      tos_box.click

      easySaleConsent_box = driver.find_element(id: 'easySaleConsent')
      easySaleConsent_box.click

      easyBuyConsent_box = driver.find_element(id: 'easyBuyConsent')
      easyBuyConsent_box.click

      # Sumbmit form
      reg_button = driver.find_element(name: 'login')
      reg_button.click

      # Confirm user used wrong email address
      wrong_email = driver.find_element(id: "register_email_error")
      wrong_emailtext = wrong_email.text
      expect(wrong_emailtext).to eq("Email adresa koju ste uneli nije ispravna")
      
      driver.quit



    end
  end
end
