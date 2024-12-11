Then(/^I see a list of the available products$/) do |table|
  @page.online_catalog_page.verify_available_products(table)
end