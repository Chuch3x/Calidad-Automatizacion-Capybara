Given(/^I am at the landing page of GMO$/) do
  @page.landing_page.visit_landing_page
end

When('I click the button {string}') do |testButton|
  @page.browser_test_page.click_button_on_page(testButton)
end

Then(/^I see the list of compatible browsers$/) do |table|
  @page.browser_test_page.verify_technologies(table)
end