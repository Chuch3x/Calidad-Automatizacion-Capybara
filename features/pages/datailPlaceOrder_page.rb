class DetailPlaceOrderPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_order_totals(table)
      totals_table = find('table', text: 'Product Total Sales Tax Shipping & Handling Grand Total')
      
      table.rows_hash.each do |item, amount|
        within(totals_table) do
          expect(page).to have_content(item)
          expect(page).to have_content(amount)
        end
      end
    end
  end