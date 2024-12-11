Then(/^I see a list of the available products$/) do |table|
    expected_products = table.raw.flatten
  
    within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do

      rows = all('tr')

      rows.drop(1).each do |row|
        product_name = row.all('td')[1].text.strip
        expect(expected_products).to include(product_name)
      end
    end
  end
  