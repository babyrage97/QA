class UserPage


  #css selectors
 SUCCESS_REG = {xpath: "/html/body/div/div/div/div/div/p[1]"}
 SHORTPW_BOX = {xpath: "/html/body/div[1]/div/div/div/div/div/div/div[1]/form/div[3]/div[1]"}
 ALREADY_USED_EMAIL = {id: "register_email_error"}

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end
  
  def user_success()
    success_reg = @driver.find_element(SUCCESS_REG)
    success_reg.text
  end
  
  def user_shortpw()
    shortpw_box = @driver.find_element(SHORTPW_BOX)
    shortpw_box.text
  end

  def user_already_used_email()
    already_used_email = @driver.find_element(ALREADY_USED_EMAIL)
    already_used_email.text
  end





  
end