Feature: As an online shopper
  I want to get an error when I fill in some field incorrectly
  So I can continue with my purchase

Background:
  Given I am at the landing page of GMO
  When I click the button "Enter GMO OnLine"

@maximize
Scenario Outline: Fill the quantity input with letters
  And I write "<input>" in the input box of the product "<product>"
  When I click the button "Place An Order"
  Then I receive a notification "Please enter only digits in this field."

  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | cuatro|
    | External Frame Backpack| seis  |
    | Glacier Sun Glasses    | uno   |
    | Padded Socks           | trece |
    | Hiking Boots           | dieciocho |
    | Back Country Shorts    | nueve |

