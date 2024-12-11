Then('I see the following order totals:') do |table|
  @page.detail_place_order_page.verify_order_totals(table)
end