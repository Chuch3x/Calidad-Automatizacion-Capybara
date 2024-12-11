class PlaceAnOrderPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def write_quantities(table)
      within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody') do
        table.hashes.each do |row|
          product = row['product']
          quantity = row['input']
          
          row = find('tr', text: product)
          row.find('input[type="text"]').set(quantity)
        end
      end
    end
  
    def verify_form_fields(table)
      expected_form_values = table.raw.flatten
      form_values_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) > table:nth-child(1)"
      within(form_values_selector) do
        rows = all('tr')
        rows.each_with_index do |row, index|
          next if index == 0 # cabeceras
          next if row.all('td')[0].text.strip == ""
          value_name = row.all('td')[0].text.strip
          expect(expected_form_values).to include(value_name)
        end
      end
    end
  
    def fill_form_with_data(table)
      data = table.rows_hash
      data.each do |key, value|
        case key
        when "Name"
          fill_in 'billName', with: value
        when "Address"
          fill_in 'billAddress', with: value
        when "City"
          fill_in 'billCity', with: value
        when "State"
          fill_in 'billState', with: value
        when "Zip"
          fill_in 'billZipCode', with: value
        when "Phone"
          fill_in 'billPhone', with: value
        when "E-mail"
          fill_in 'billEmail', with: value
        when "Card Type"
          select value, from: 'CardType'
        when "Card Number"
          fill_in 'CardNumber', with: value
        when "Expiration"
          fill_in 'CardDate', with: value unless value == "omit"
        end
      end
    end
  
    def check_ship_to_same_person
      expect(page).to have_field('shipSameAsBill', type: 'checkbox')
      check('shipSameAsBill')
    end
  
    def verify_content(content)
      expect(page).to have_content(content, wait: 10)
    end
  
    def leave_field_empty(field)
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
  
    def verify_popup_warning(message)
      alert = page.driver.browser.switch_to.alert
      expect(alert.text).to eq(message)
      alert.accept
    end
  end