
  When('I click on the button {string}') do |button_text|
    click_button(button_text)
  end
  
  Then('I see the list of compatible browsers') do |table|
    expected_browsers = table.raw.flatten
    actual_browsers = find_all('.browser-list').map(&:text)
    expect(actual_browsers).to match_array(expected_browsers)
  end
  
  And('I click on the product {string}') do |product_name|
    click_link(product_name)
  end
  
  Then('I should see its description {string}') do |description|
    expect(page).to have_content(description)
  end
  