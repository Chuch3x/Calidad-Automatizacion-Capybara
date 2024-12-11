class DetailProductPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def click_button_on_page(button_text)
      click_button(button_text)
    end
  
    def click_product_link(product_name)
      click_link(product_name)
    end
  
    def verify_description(description)
      expect(page).to have_content(description),
        "Expected description '#{description}' not found on the page."
    end
  
    def verify_price(price)
      expect(page).to have_content(price),
        "Expected price '#{price}' not found on the page."
    end
  
    def verify_stock(stock)
      expect(page).to have_content(stock),
        "Expected stock '#{stock}' not found on the page."
    end
  
    def verify_item_number(item_number)
      expect(page).to have_content(item_number),
        "Expected item number '#{item_number}' not found on the page."
    end
  end