class ResetFeaturePage
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_form(table)
      within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
        table.hashes.each do |row|
          product = row['product']
          input = row['input']
          product_row = find('tr', text: product)
          actual_value = product_row.find('input[type="text"]').value
          expect(actual_value).to eq(input)
        end
      end
    end
  end