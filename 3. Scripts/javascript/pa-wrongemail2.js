const { Builder } = require('selenium-webdriver');
const assert = require('assert');
const SignupPage = require('./signup_page');
const UserPage = require('./user_page');

const email = 'testtest.me';
const password = 'Testic123';
const password2 = 'Testic123';
const wrongEmailText = 'Email adresa koju ste uneli nije ispravna';

describe('Polovni automobili application:', function () {
  describe('signup to the polovni automobili application', function () {
    it('Confirm user used wrong email address', async function () {
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

      // Confirm user used wrong email address
      const user = new UserPage(driver);
      const alreadyUsedEmail = await user.userAlreadyUsedEmail();
      assert.strictEqual(alreadyUsedEmail, wrongEmailText);

      await driver.quit();
    });
  });
});

