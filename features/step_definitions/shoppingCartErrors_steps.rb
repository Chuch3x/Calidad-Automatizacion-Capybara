Then(/^I receive a notification "(.*)"$/) do |notification|
  @page.shopping_cart_errors_page.verify_notification(notification)
end