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

When('I click on the button {string}') do |button_text|
  click_button(button_text)
  sleep(2)
end

And('I click on the button {string} Button') do |button_text|
  click_button(button_text)
  sleep(2)
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
  
  When(/^I click on the "Place The order" Button$/) do
    click_button('bSubmit')
  end

  And(/^I check the option "Ship To: Same as 'Bill To'"$/) do
    expect(page).to have_field('shipSameAsBill', type: 'checkbox')
    check('shipSameAsBill')
  end
  

Then('I see the {string}') do |content|
  expect(page).to have_content(content, wait: 10)
end