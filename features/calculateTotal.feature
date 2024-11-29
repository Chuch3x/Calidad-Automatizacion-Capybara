Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario Outline: Fill the quantity of just one product
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I see the total price for each product
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 1     | 
    | External Frame Backpack| 1     |  
    | Glacier Sun Glasses    | 1     | 
    | Padded Socks           | 1     | 
    | Hiking Boots           | 1     |  
    | Back Country Shorts    | 1     |

Scenario: Fill the quantity of six different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 15    | 
    | External Frame Backpack| 7     |  
    | Glacier Sun Glasses    | 2     | 
    | Padded Socks           | 19    | 
    | Hiking Boots           | 12    |  
    | Back Country Shorts    | 18    |

    When I click the button "Place An Order"
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly