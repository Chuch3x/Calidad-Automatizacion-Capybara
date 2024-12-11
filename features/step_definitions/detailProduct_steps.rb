When('I click on the button {string}') do |button_text|
  @page.detail_product_page.click_button_on_page(button_text)
end

And('I click on the product {string}') do |product_name|
  @page.detail_product_page.click_product_link(product_name)
end

Then('I should see its description {string}') do |description|
  @page.detail_product_page.verify_description(description)
end

Then('I should see its price {string}') do |price|
  @page.detail_product_page.verify_price(price)
end

Then('I should see its stock {string}') do |stock|
  @page.detail_product_page.verify_stock(stock)
end

Then('I should see its item number {string}') do |item_number|
  @page.detail_product_page.verify_item_number(item_number)
end