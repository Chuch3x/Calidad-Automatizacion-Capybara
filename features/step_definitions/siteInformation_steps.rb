Then(/^I see the list of technologies used for the site$/) do |table|
  @page.site_information_page.verify_technologies(table)
end