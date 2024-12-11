require 'selenium-webdriver'

When(/^I write the quantities for the products as the table below:$/) do |table|
  @page.place_an_order_page.write_quantities(table)
end

Then(/^I see a form on the left side of the screen with the following fields:$/) do |table|
  @page.place_an_order_page.verify_form_fields(table)
end

And(/^I fill the form with the following data:$/) do |table|
  @page.place_an_order_page.fill_form_with_data(table)
end

When(/^I check the option to ship the order to the same person$/) do
  @page.place_an_order_page.check_ship_to_same_person
end

And(/^I check the option "Ship To: Same as 'Bill To'"$/) do
  @page.place_an_order_page.check_ship_to_same_person
end

Then('I see the {string}') do |content|
  @page.place_an_order_page.verify_content(content)
end

When(/^I leave the field (.+) empty$/) do |field|
  @page.place_an_order_page.leave_field_empty(field)
end

Then(/^I see a pop-up with the warning "([^"]*)"$/) do |message|
  @page.place_an_order_page.verify_popup_warning(message)
end