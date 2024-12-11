
  
  # Este paso verifica que los totales de la orden estén visibles.
  Then('I see the following order totals:') do |table|
    # Encuentra la tabla específica que contiene los totales del pedido
    totals_table = find('table', text: 'Product Total Sales Tax Shipping & Handling Grand Total')
    
    # Ahora buscamos los totales que están después de los productos
    table.rows_hash.each do |item, amount|
      within(totals_table) do
        expect(page).to have_content(item)
        expect(page).to have_content(amount)
      end
    end
  end