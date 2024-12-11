Then(/^the form looks like the following table$/) do |table|
  @page.reset_feature_page.verify_form(table)
end