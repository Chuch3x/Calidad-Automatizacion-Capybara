And(/^I see the summary of my purchase$/) do
  expect(page).to have_content("Place Order")
end

Then(/^I see the following table in the Ship to form:$/) do |table|
  data = table.rows_hash
  field_mappings = {
    "Name" => 'shipName',
    "Address" => 'shipAddress',
    "City" => 'shipCity',
    "State" => 'shipState',
    "Zip" => 'shipZipCode',
    "Phone" => 'shipPhone'
  }

  within('body > form > table > tbody > tr:nth-child(2) > td:nth-child(3) > table') do
    data.each do |key, value|
      field_name = field_mappings[key]
      expect(find("input[name='#{field_name}']").value).to eq(value)
    end
  end
end