class SignupPage {
  // CSS selectors
  EMAIL_FIELD = { id: 'email' };
  PASSWORD_FIELD = { id: 'password_first' };
  PASSWORD2_FIELD = { id: 'password_second' };
  TOS_BOX = { id: 'tos' };
  EASYSALECONSENT_BOX = { id: 'easySaleConsent' };
  EASYBUYCONSENT_BOX = { id: 'easySaleConsent' };
  REG_BUTTON = { name: 'login' };

  constructor(driver) {
    this.driver = driver;
  }

  async enterEmailAddress(email) {
    const emailField = await this.driver.findElement(this.EMAIL_FIELD);
    await emailField.sendKeys(email);
  }

  async enterPassword(password) {
    const passwordField = await this.driver.findElement(this.PASSWORD_FIELD);
    await passwordField.sendKeys(password);
  }

  async enterPassword2(password2) {
    const password2Field = await this.driver.findElement(this.PASSWORD2_FIELD);
    await password2Field.sendKeys(password2);
  }

  async clickRules() {
    const tosBox = await this.driver.findElement(this.TOS_BOX);
    await tosBox.click();
  }

  async clickEasySale() {
    const easySaleConsentBox = await this.driver.findElement(this.EASYSALECONSENT_BOX);
    await easySaleConsentBox.click();
  }

  async clickEasyBuy() {
    const easyBuyConsentBox = await this.driver.findElement(this.EASYBUYCONSENT_BOX);
    await easyBuyConsentBox.click();
  }

  async clickLogin() {
    const regButton = await this.driver.findElement(this.REG_BUTTON);
    await regButton.click();
  }
}