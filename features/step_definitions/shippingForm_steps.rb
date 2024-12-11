And(/^I see the summary of my purchase$/) do
  @page.shipping_form_page.verify_summary_of_purchase
end

Then(/^I see the following table in the Ship to form:$/) do |table|
  @page.shipping_form_page.verify_ship_to_form(table)
end