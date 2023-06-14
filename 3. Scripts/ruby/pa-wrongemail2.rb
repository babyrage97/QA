require 'selenium-webdriver'
require 'rspec'
require_relative "singup_page.rb"
require_relative "user_page.rb"

email = "testtest.me"
password = 'Testic123'
password2 = 'Testic123'
wrong_emailtext = "Email adresa koju ste uneli nije ispravna"

# Test fir registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'Confirm user used wrong email address' do
      @driver = Selenium::WebDriver.for :firefox
      # Go to sing-in form
      @driver.navigate.to 'https://www.polovniautomobili.com/registracija'

      # Fill out form
      signup = SignupPage.new(@driver)
      signup.enter_email_address(email)
      signup.enter_password(password)
      signup.enter_password2(password2)
      signup.click_rules
      signup.click_easysale
      signup.click_easybuy
      signup.click_login

      sleep 1

      # Confirm user used wrong email address
      user = UserPage.new(@driver)
      already_used_email = user.user_already_used_email
      expect(already_used_email).to eq(wrong_emailtext)

      @driver.quit

    end
  end
end
