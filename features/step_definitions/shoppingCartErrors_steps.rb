Then(/^I receive a notification "(.*)"$/) do |notification|
  page.driver.browser.switch_to.alert.text == notification
  page.driver.browser.switch_to.alert.accept
end