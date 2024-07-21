import { When, Then, Given, Before, After, setDefaultTimeout } from '@cucumber/cucumber'
import { By } from "selenium-webdriver"
import { expect } from "chai"

import { initDriver, quitDriver } from '../supports/driverUtil.js'

setDefaultTimeout(60 * 1000)

let driver

Before(async function() {
  driver = await initDriver()
})

After(function() {
  quitDriver(driver)
})

Given('Iam in registration page', async function() {
  await driver.get("http://localhost:8000/register")
})

When('I enter the username as {string}', async function(username) {
  const usernameField = await driver.findElement(By.name('username'))
  await usernameField.sendKeys(username)
  await driver.sleep(1000)
})

When('I enter valid email address as {string}', async function(email) {
  const emailField = await driver.findElement(By.name('email'))
  await emailField.sendKeys(email)
  await driver.sleep(1000)
})

Given('I enter password as {string}', async function(password) {
  const passwordField = await driver.findElement(By.name('password'))
  await passwordField.sendKeys(password)
  await driver.sleep(1000)
})

Given('I click on the register button', async function() {
  const registerButton = await driver.findElement(By.css('input[type="submit"]'))
  await registerButton.click();
  await driver.sleep(1000)
})

Then('I should redirect to Login page', async function() {
  const currentUrl = await driver.getCurrentUrl();
  expect(currentUrl).to.include('/register');
  await driver.sleep(1000)
})
