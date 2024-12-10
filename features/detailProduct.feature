Feature: As a buyer 
  I want to see the description of a product
  so I see the information of all products

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

  @slow @maximize
  Scenario Outline: Look for a product description in the borland store
    And I click on the product "<product>"
    Then I should see its description "<description>"
    Then I should see its price "<price>"
    Then I should see its stock "<stock>"
    Then I should see its item number "<item_number>"
    Examples:
      | product                | description                                                                                  | price  | stock  | item_number |
      | 3 Person Dome Tent     | Our best 3 person backpack dome tent                                                        | $ 299.99  | 23  | 1000 |
      | External Frame Backpack| Our most popular external frame backpack                                                   | $ 179.95  | 8  | 1001 |
      | Glacier Sun Glasses    | Our best glacier sun glasses will protect you on your next expedition or when you hit the slopes. | $ 67.99  | 138  | 1002 |
      | Padded Socks           | Our favorite padded socks will make your next back country trek easier on your feet.        | $ 19.99  | 47  | 1003 |
      | Hiking Boots           | Climb any mountain with our PermaDry all leather hiking boots.                              | $ 109.90  | 32  | 1004 |
      | Back Country Shorts    | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp. | $ 24.95  | 59  | 1005 |

