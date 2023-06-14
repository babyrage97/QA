class UserPage


  #css selectors
 SUCCESS_REG = {xpath: "/html/body/div/div/div/div/div/p[1]"}


  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end
  
  def user_success()
    success_reg = @driver.find_element(SUCCESS_REG)
    success_reg.text
  end



  
end