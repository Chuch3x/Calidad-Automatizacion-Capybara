
  When('I click on the button {string}') do |button_text|
    click_button(button_text)
  end
  
  And('I click on the product {string}') do |product_name|
    click_link(product_name)
  end
  
  Then('I should see its description {string}') do |description|
    expect(page).to have_content(description)
  end
  