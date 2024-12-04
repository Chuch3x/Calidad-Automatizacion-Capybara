Feature: As a person in the Catalog
  I want to see the detail of my order
  so I see the information of the place order

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario: To see information of the order
    And I write the quantities for the product with the table below  
        | product                | input |  
        | 3 Person Dome Tent     | 1   |  
        | External Frame Backpack| 2   |  
        | Glacier Sun Glasses    | 3   |  
        | Padded Socks           | 4   |  
        | Hiking Boots           | 5   |  
        | Back Country Shorts    | 6   |  
    When I click the button "Place An Order"  
    Then the order details should display the following table:
        | Qty | Product Description      | Delivery Status | Unit Price | Total Price |
        | 1   | 3 Person Dome Tent       | To Be Shipped   | $ 299.99   | $ 299.99    |
        | 2   | External Frame Backpack  | To Be Shipped   | $ 179.95   | $ 359.90    |
        | 3   | Glacier Sun Glasses      | To Be Shipped   | $ 67.99    | $ 203.97    |
        | 4   | Padded Socks             | To Be Shipped   | $ 19.99    | $ 79.96     |
        | 5   | Hiking Boots             | To Be Shipped   | $ 109.90   | $ 549.50    |
        | 6   | Back Country Shorts      | To Be Shipped   | $ 24.95    | $ 149.70    |
    And I see the following order totals:
        | Item                  | Amount   |
        | Product Total         | $ 1643.02|
        | Sales Tax             | $ 82.15  |
        | Shipping & Handling   | $ 5.00   |
        | Grand Total           | $ 1730.17|