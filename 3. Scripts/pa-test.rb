require 'selenium-webdriver'
require 'rspec'

# Test for registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'confirm that a user can successfully signup' do
      timestemp = Time.now.to_i
      driver = Selenium::WebDriver.for :firefox
      # Go to sing-in form
      driver.navigate.to 'https://www.polovniautomobili.com/registracija'

      # Fill out form
      email_field = driver.find_element(id: 'email')
      email_field.send_keys("test#{timestemp}@test.me")

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

      sleep 1

      # Confirm user is singed up successufly
      success_reg = driver.find_element(xpath: "/html/body/div/div/div/div/div/p[1]")
      success_regtext = success_reg.text
      expect(success_regtext).to eq("Hvala na registraciji!")
      
      driver.quit


    end
  end
end
