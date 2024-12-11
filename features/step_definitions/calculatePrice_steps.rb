And(/^I write "(.*)" in the input box of the product "(.*)"$/) do |input, product|
  @page.calculate_price_page.write_in_input_box(input, product)
end

Then(/^I see the total price for each product$/) do
  @page.calculate_price_page.verify_total_price_for_each_product
end

And(/^I write the quantities for the product with the table below$/) do |table|
  @page.calculate_price_page.write_quantities_for_products(table)
end

And(/^I see the correct Sales Tax for the order$/) do
  @page.calculate_price_page.verify_correct_sales_tax
end

And(/^I see the Grand Total calculated correctly$/) do
  @page.calculate_price_page.verify_grand_total
end

Then(/^I see the Product Total for all the products as the table show below$/) do |table|
  @page.calculate_price_page.verify_product_total(table)
end
And(/^I don't write any quantity for any product$/) do |table|
  @page.calculate_price_page.write_no_quantity_for_products(table)
end

Then(/^I see a pop up with a warning message "Please Order Something First"$/) do
  @page.calculate_price_page.verify_popup_warning("Please Order Something First")
end