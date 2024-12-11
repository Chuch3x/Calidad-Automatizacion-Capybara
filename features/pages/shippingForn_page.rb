class ShippingFormPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_summary_of_purchase
      expect(page).to have_content("Place Order")
    end
  
    def verify_ship_to_form(table)
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
  end