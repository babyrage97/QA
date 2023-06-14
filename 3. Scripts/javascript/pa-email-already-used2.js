const { Builder, By } = require('selenium-webdriver');
const assert = require('assert');
const SignupPage = require('./signup_page');
const UserPage = require('./user_page');

const email = 'test@test.me';
const alreadyUsedEmailText = 'Uneta E-mail adresa je već zauzeta';
const password = 'testic123';

describe('Polovni automobili application:', function() {
  describe('signup to the polovni automobili application', function() {
    it('Confirm user already used this email address', async function() {
      const driver = await new Builder().forBrowser('firefox').build();

      // Go to sign-in form
      await driver.get('https://www.polovniautomobili.com/registracija');

      // Fill out form
      const signup = new SignupPage(driver);
      await signup.enterEmailAddress(email);
      await signup.enterPassword(password);

      await driver.sleep(1000);

      // Confirm user already used this email address
      const user = new UserPage(driver);
      const alreadyUsedEmail = await user.userAlreadyUsedEmail();
      assert.strictEqual(alreadyUsedEmail, alreadyUsedEmailText);

      await driver.quit();
    });
  });
});