class SignupPage


  #css selectors
  EMAIL_FIELD = {id: 'email'}
  PASSWORD_FIELD = {id: 'password_first'}
  PASSWORD2_FIELD = {id: 'password_second'}
  TOS_BOX = {id: 'tos'}
  EASYSALECONSENT_BOX = {id: 'easySaleConsent'}
  EASYBUYCONSENT_BOX = {id: 'easySaleConsent'}
  REG_BUTTON = {name: 'login'}


  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def  enter_email_address(email)
    email_field = @driver.find_element(EMAIL_FIELD)
    email_field.send_keys(email)

  end

  def  enter_password(password)
    password_field = @driver.find_element(PASSWORD_FIELD)
    password_field.send_keys(password)

  end

  def  enter_password2(password2)
    password2_field = @driver.find_element(PASSWORD2_FIELD)
    password2_field.send_keys(password2)

  end

  def click_rules()
    tos_box = @driver.find_element(TOS_BOX)
    tos_box.click
  end

  def click_easysale()
    easySaleConsent_box = driver.find_element(EASYSALECONSENT_BOX)
    easySaleConsent_box.click
  end

  def click_easybuy()
    easyBuyConsent_box = driver.find_element(EASYBUYCONSENT_BOX)
    easyBuyConsent_box.click
  end

  def click_login()
    reg_button = driver.find_element(REG_BUTTON)
    reg_button.click
  end


  
end