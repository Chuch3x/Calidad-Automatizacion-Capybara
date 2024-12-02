Feature: As an online shopper 
  I want the system to automatically calculate the final amount
  so I can see how much I need to pay

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

@maximize
Scenario: Fill the quantity of six different products
	And I write the quantities for the product with the table below 
    | product                | input |   
    | 3 Person Dome Tent     | 2     | 
    | External Frame Backpack| 3     |  
    | Glacier Sun Glasses    | 2     | 
    | Padded Socks           | 10    | 
    | Hiking Boots           | 5     |  
    | Back Country Shorts    | 3     |

    When I click the button "Place An Order"
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly

@maximize
Scenario: No fill the quantity of six different products
  And I don't write any quantity for any product 
    | product                | input |   
    | 3 Person Dome Tent     | 0     | 
    | External Frame Backpack| 0     |  
    | Glacier Sun Glasses    | 0     | 
    | Padded Socks           | 0     | 
    | Hiking Boots           | 0     |  
    | Back Country Shorts    | 0     |

  When I click the button "Place An Order"
  Then I see a pop up with a warning message
