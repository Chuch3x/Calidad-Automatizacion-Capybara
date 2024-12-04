Feature: Resetting the product form
  As a user who changes their mind
  I want to clear all quantity fields with one action
  So I can reconsider my purchase

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize  
Scenario: Clear all product quantities in the form  
    And I write the quantities for the product with the table below  
        | product                | input |  
        | 3 Person Dome Tent     | 100   |  
        | External Frame Backpack| 200   |  
        | Glacier Sun Glasses    | 300   |  
        | Padded Socks           | 400   |  
        | Hiking Boots           | 500   |  
        | Back Country Shorts    | 600   |  
    When I click the button "Reset"  
    Then the form looks like the following table  
        | product                | input |
        | 3 Person Dome Tent     | 0     |
        | External Frame Backpack| 0     |
        | Glacier Sun Glasses    | 0     |
        | Padded Socks           | 0     |  
        | Hiking Boots           | 0     |  
        | Back Country Shorts    | 0     |