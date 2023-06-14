const { Builder } = require('selenium-webdriver');
const assert = require('assert');
const SignupPage = require('./signup_page');
const UserPage = require('./user_page');

const timestamp = Math.floor(Date.now() / 1000);
const email = `test${timestamp}@test.me`;
const password = 'Testic';
const password2 = 'Testic';
const shortPwText = 'Šifra je kraća od 8 znakova';

describe('Polovni automobili application:', function () {
  describe('signup to the polovni automobili application', function () {
    it('confirm user use short password', async function () {
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

      await driver.sleep(2000);

      // Confirm user use short password
      const user = new UserPage(driver);
      const shortPwBox = await user.userShortPw();
      assert.strictEqual(shortPwBox, shortPwText);

      await driver.quit();
    });
  });
});