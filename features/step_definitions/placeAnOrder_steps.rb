require 'selenium-webdriver'

When(/^I write the quantities for the products as the table below:$/) do |table|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody') do
    table.hashes.each do |row|
      product = row['product']
      quantity = row['input']
      
      row = find('tr', text: product)
      row.find('input[type="text"]').set(quantity)
    end
  end
end

Then(/^I see a form on the left side of the screen with the following fields:$/) do |table|
    expected_form_values = table.raw.flatten
    form_values_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > table:nth-child(1)"
    within(form_values_selector) do
      rows = all('tr')
      rows.each_with_index do |row, index|
        next if index == 0 #cabeceras..
        next if row.all('td')[0].text.strip == ""
        value_name = row.all('td')[0].text.strip
        expect(expected_form_values).to include(value_name)
      end
    end
  end

And(/^I fill the form with the following data:$/) do |table|
    data = table.rows_hash
    data.each do |key, value|
      case key
      when "Name"
        fill_in 'billName', with: value
        @name = value
      when "Address"
        fill_in 'billAddress', with: value
        @address = value
      when "City"
        fill_in 'billCity', with: value
        @city = value
      when "State"
        fill_in 'billState', with: value
        @state = value
      when "Zip"
        fill_in 'billZipCode', with: value
        @zip = value
      when "Phone"
        fill_in 'billPhone', with: value
        @phone = value
      when "E-mail"
        fill_in 'billEmail', with: value
        @email = value
      when "Card Type"
        select value, from: 'CardType'
        @card_type = value
      when "Card Number"
        fill_in 'CardNumber', with: value
        @card_number = value
      when "Expiration"
        unless value == "omit"
          fill_in 'CardDate', with: value
          @expiration = value
        end
      end
    end
  end
  
  When(/^I check the option to ship the order to the same person$/) do
    expect(page).to have_field('shipSameAsBill', type: 'checkbox')
    check('shipSameAsBill')
  end

  And(/^I check the option "Ship To: Same as 'Bill To'"$/) do
    expect(page).to have_field('shipSameAsBill', type: 'checkbox')
    check('shipSameAsBill')
  end
  

Then('I see the {string}') do |content|
  expect(page).to have_content(content, wait: 10)
end


When(/^I leave the field (.+) empty$/) do |field|
  case field
  when "Name"
    fill_in 'billName', with: ''
  when "Address"
    fill_in 'billAddress', with: ''
  when "City"
    fill_in 'billCity', with: ''
  when "State"
    fill_in 'billState', with: ''
  when "Zip"
    fill_in 'billZipCode', with: ''
  when "Phone"
    fill_in 'billPhone', with: ''
  when "E-mail"
    fill_in 'billEmail', with: ''
  when "Card Number"
    fill_in 'CardNumber', with: ''
  when "Expiration"
    fill_in 'CardDate', with: ''
  else
    raise "Field '#{field}' is not recognized or not implemented in the test case"
  end
end

Then(/^I see a pop-up with the warning "([^"]*)"$/) do |message|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to eq(message)
  alert.accept
end
