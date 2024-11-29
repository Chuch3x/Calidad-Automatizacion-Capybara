require 'selenium-webdriver'

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




