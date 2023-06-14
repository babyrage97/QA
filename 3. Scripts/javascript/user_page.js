class UserPage {
  // CSS selectors
  SUCCESS_REG = { xpath: "/html/body/div/div/div/div/div/p[1]" };
  SHORTPW_BOX = { xpath: "/html/body/div[1]/div/div/div/div/div/div/div[1]/form/div[3]/div[1]" };
  ALREADY_USED_EMAIL = { id: "register_email_error" };

  constructor(driver) {
    this.driver = driver;
  }

  async userSuccess() {
    const successReg = await this.driver.findElement(this.SUCCESS_REG);
    return await successReg.getText();
  }

  async userShortPw() {
    const shortPwBox = await this.driver.findElement(this.SHORTPW_BOX);
    return await shortPwBox.getText();
  }

  async userAlreadyUsedEmail() {
    const alreadyUsedEmail = await this.driver.findElement(this.ALREADY_USED_EMAIL);
    return await alreadyUsedEmail.getText();
  }
}