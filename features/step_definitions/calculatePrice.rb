And(/^I write "(.*)" in the input box of the product "(.*)"$/) do |input, product|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody') do
    row = find('tr', text: product)
    row.find('input[type="text"]').set(input)
  end
end

Then(/^I see the total price for each product$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do
        rows = all("tr")
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                quantity = cells[0].text.strip.to_f
                unit_price = cells[3].text.strip.gsub(/[^\d\.]/, '').to_f
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f

                expected_total_price = (unit_price * quantity).round(2)
                expect(total_price).to eq(expected_total_price)
            end
        end
    end
end

And(/^I write the quantities for the product with the table below$/) do | table |
    data = table.rows_hash  
    data.each_pair do |key, value|
        case key
            when "3 Person Dome Tent"
                fill_in 'QTY_TENTS', :with => value
            when "External Frame Backpack"
                fill_in 'QTY_BACKPACKS', :with => value
            when "Glacier Sun Glasses"
                fill_in 'QTY_GLASSES', :with => value
            when "Padded Socks"
                fill_in 'QTY_SOCKS', :with => value
            when "Hiking Boots"
                fill_in 'QTY_BOOTS', :with => value
            when "Back Country Shorts"
                fill_in 'QTY_SHORTS', :with => value
        end
    end
end

And(/^I see the correct Sales Tax for the order$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do 
        rows = all("tr")
        expected_product_total = 0.0 
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
                expected_product_total += total_price
            end
        end

        cells = rows[rows.count - 4].all('td') 
        product_total = cells[2].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 3].all('td') 
        sales_tax = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        expected_sales_tax = (expected_product_total.round(2) * 0.05).round(2)
        expect(sales_tax).to eq(expected_sales_tax)
    end
end

And(/^I see the Grand Total calculated correctly$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do 
        rows = all("tr")
        expected_product_total = 0.0 
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
                expected_product_total += total_price
            end
        end
        cells = rows[rows.count - 4].all('td') 
        product_total = cells[2].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 3].all('td') 
        sales_tax = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 1].all('td') 
        grand_total = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        expected_grand_total = (sales_tax + product_total + 5.0).round(2)
        expect(grand_total).to eq(expected_grand_total)
    end
end

Then(/^I see the Product Total for all the products as the table show below$/) do |table|
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    
    within(summary_table_selector) do
      rows = all("tr")
      expected_data = table.hashes.each_with_object({}) do |row, hash|
        hash[row['product']] = row['price'].to_f
      end
      
      rows.each_with_index do |row, index|
        next if index == 0
        
        cells = row.all('td')
        if cells.count == 5
          product_name = cells[0].text.strip
          calculated_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
          if expected_data.key?(product_name)
            expected_price = expected_data[product_name]
            expect(calculated_price).to eq(expected_price), 
              "El precio calculado para '#{product_name}' no coincide. " \
              "Esperado: #{expected_price}, Calculado: #{calculated_price}"
          end
        end
      end
    end
  end
And(/^I don't write any quantity for any product$/) do |table|
    data = table.rows_hash  
    data.each_pair do |key, value|
      case key
      when "3 Person Dome Tent"
        fill_in 'QTY_TENTS', :with => value
      when "External Frame Backpack"
        fill_in 'QTY_BACKPACKS', :with => value
      when "Glacier Sun Glasses"
        fill_in 'QTY_GLASSES', :with => value
      when "Padded Socks"
        fill_in 'QTY_SOCKS', :with => value
      when "Hiking Boots"
        fill_in 'QTY_BOOTS', :with => value
      when "Back Country Shorts"
        fill_in 'QTY_SHORTS', :with => value
      end
    end
  end
  
  Then(/^I see a pop up with a warning message$/) do
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq("Please Order Something First")
    alert.accept
  end
  