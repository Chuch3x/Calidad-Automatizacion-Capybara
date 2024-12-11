class ShoppingCartErrorsPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_notification(notification)
      alert = page.driver.browser.switch_to.alert
      expect(alert.text).to eq(notification)
      alert.accept
    end
  end