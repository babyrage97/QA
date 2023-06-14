const { Builder } = require('selenium-webdriver');
const assert = require('assert');
const SignupPage = require('./signup_page');
const UserPage = require('./user_page');

const timestamp = Math.floor(Date.now() / 1000);
const email = `test${timestamp}@test.me`;
const password = 'Testic123';
const password2 = 'Testic123';
const successRegText = 'Hvala na registraciji!';

describe('Polovni automobili application:', function () {
  describe('signup to the polovni automobili application', function () {
    it('confirm that a user can successfully signup', async function () {
      const driver = await new Builder().forBrowser('firefox').build();

      // Go to sign-in form
      await driver.get('https://www.polovniautomobili.com/registracija');

      // Fill out form
      const signup = new SignupPage(driver);
      await signup.enterEmailAddress(email);
      await signup.enterPassword(password);
      await signup.enterPassword2(password2);
      await signup.clickRules();
      await signup.clickEasySale();
      await signup.clickEasyBuy();
      await signup.clickLogin();

      await driver.sleep(1000);

      // Confirm user is signed up successfully
      const user = new UserPage(driver);
      const successReg = await user.userSuccess();
      assert.strictEqual(successReg, successRegText);

      await driver.quit();
    });
  });
});