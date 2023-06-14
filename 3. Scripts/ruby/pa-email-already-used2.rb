require 'selenium-webdriver'
require 'rspec'
require_relative "singup_page.rb"
require_relative "user_page.rb"

email = "test@test.me"
already_used_emailtext = "Uneta E-mail adresa je već zauzeta"
password = "testic123"

# Test fir registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'Confirm user already used this email address' do
      @driver = Selenium::WebDriver.for :firefox
      # Go to sing-in form
      @driver.navigate.to 'https://www.polovniautomobili.com/registracija'

      # Fill out form
      signup = SignupPage.new(@driver)
      signup.enter_email_address(email)
      signup.enter_password(password)
      
      sleep 1

      # Confirm user already used this email address
      user = UserPage.new(@driver)
      already_used_email = user.user_already_used_email
      expect(already_used_email).to eq(already_used_emailtext)
      
      @driver.quit

    end
  end
end
