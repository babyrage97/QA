require 'selenium-webdriver'
require 'rspec'
require_relative "singup_page.rb"
require_relative "user_page.rb"

timestemp = Time.now.to_i
email = "test#{timestemp}@test.me"
password = 'Testic'
password2 = 'Testic'
shortpw_text = "Šifra je kraća od 8 znakova"


# Test for registration at polovni automoboili
describe 'Polovni automobili application:' do
  describe 'signup to the polovni automobili application' do
    it 'confirm that a user can successfully signup' do
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


      sleep 2

      # Confirm user is singed up successufly
      user = UserPage.new(@driver)
      shortpw_box = user.user_shortpw
      expect(shortpw_box).to eq(shortpw_text)
      
      @driver.quit

    end
  end
end
