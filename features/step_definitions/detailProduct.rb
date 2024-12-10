When('I click on the button {string}') do |button_text|
  click_button(button_text)
end

And('I click on the product {string}') do |product_name|
  click_link(product_name)
end

Then('I should see its description {string}') do |description|
  expect(page).to have_content(description),
    "Expected description '#{description}' not found on the page."
end

Then('I should see its price {string}') do |price|
  expect(page).to have_content(price),
    "Expected price '#{price}' not found on the page."
end

Then('I should see its stock {string}') do |stock|
  expect(page).to have_content(stock),
    "Expected stock '#{stock}' not found on the page."
end

Then('I should see its item number {string}') do |item_number|
  expect(page).to have_content(item_number),
    "Expected item number '#{item_number}' not found on the page."
end
